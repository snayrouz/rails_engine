require 'rails_helper'

RSpec.describe "user can get invoices index" do
  it "by calling api" do
    invoice = create_list(:invoice, 4)

    get "/api/v1/invoices"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(4)
    expect(result[3]["id"]).to eq(invoice[3].id)
    expect(result[0]["customer_name"]).to eq(invoice[0].customer.name)
    expect(result[1]["merchant_name"]).to eq(invoice[1].merchant.name)
    expect(result[2]["status"]).to eq(invoice[2].status)
  end
end
