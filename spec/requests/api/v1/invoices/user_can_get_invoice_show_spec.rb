require 'rails_helper'

RSpec.describe "user can get invoice show" do
  scenario "by calling api" do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{invoice.id}"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(invoice.id)
    expect(result["customer_name"]).to eq(invoice.customer.name)
    expect(result["merchant_name"]).to eq(invoice.merchant.name)
    expect(result["status"]).to eq(invoice.status)
  end
end
