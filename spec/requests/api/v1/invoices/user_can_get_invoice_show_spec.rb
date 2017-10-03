require 'rails_helper'

RSpec.feature "user can get invoice index" do
  scenario "by calling api" do
    invoice = create(:invoice)

    get "/api/v1/invoice/#{invoice.id}"
    object = JSON.parse(response)

    expect(response).to be_success
    expect(object["id"]).to eq(invoice.id)
    expect(object["customer_name"]).to eq(invoice.customer.name)
    expect(object["merchant_name"]).to eq(invoice.merchant.name)
    expect(object["status"]).to eq(invoice.status)
  end
end
