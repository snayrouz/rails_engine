require 'rails_helper'

RSpec.describe "user can get customers with pending invoices" do
  scenario "when there are customers with invoices pending" do
    merchant = create(:merchant)
    customer1, customer2 = create_list(:customer, 2)
    invoice1 = create(:invoice, status: "failed", customer: customer1, merchant: merchant)
    invoice2 = create(:invoice, status: "success", customer: customer1)
    invoice3 = create(:invoice, customer: customer2, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"
    result = JSON.parse(response.body)
    binding.pry

    expect(response).to be_success
    expect(result["id"]).to eq("#{customer1.id}")
    expect(result.count).to eq(1)
  end

  scenario "when there are no customers with invoices pending" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result).to eq(nil)
  end
end
