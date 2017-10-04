require 'rails_helper'

RSpec.describe "user can find invoice by attribute" do
  scenario "with single query" do
    invoice1 = create(:invoice, status: "deceased")
    invoice2 = create(:invoice, status: "pining")

    get "/api/v1/invoices/find?status=deceased"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(invoice1.id)
    expect(result["customer_name"]).to eq(invoice1.customer.name)
    expect(result["merchant_name"]).to eq(invoice1.merchant.name)
    expect(result["status"]).to eq(invoice1.status)
  end

  scenario "with multiple queries" do
    invoice1 = create(:invoice, status: "deceased", id: 4)
    invoice2 = create(:invoice, status: "deceased")

    get "/api/v1/invoices/find?id=4&status=deceased"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(invoice1.id)
    expect(result["customer_name"]).to eq(invoice1.customer.name)
    expect(result["merchant_name"]).to eq(invoice1.merchant.name)
    expect(result["status"]).to eq(invoice1.status)
  end

  scenario "with no results" do
    invoice1 = create(:invoice, status: "pining", id: 4)
    invoice2 = create(:invoice, status: "deceased", id: 1)

    get "/api/v1/invoices/find?id=4&status=deceased"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result).to eq(nil)
  end

end
