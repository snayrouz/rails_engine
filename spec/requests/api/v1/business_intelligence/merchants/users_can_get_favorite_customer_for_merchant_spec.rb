require 'rails_helper'

RSpec.describe "user can get merchant's favorite customer" do
  scenario "when there is one favorite" do
    merchant = create(:merchant)
    customer1, customer2 = create_list(:customer, 2)
    invoice1, invoice2 = create(:invoice, merchant: merchant, customer: customer1, 2)
    invoice3 = create(:invoice, merchant: merchant, customer: customer2)
    invoice1.items = create_list(:item, 2)
    invoice2.items = create(:item)
    invoice3.items = create(:item)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(response["id"]).to eq("#{merchant.id}")
  end

  scenario "when there are two favorites" do
    merchant = create(:merchant)
    customer1, customer2 = create(:customer, 2)
    invoice1 = create(:invoice, merchant: merchant, customer: customer1)
    invoice2 = create(:invoice, merchant: merchant, customer: customer2)
    invoice1.items = create(:item, price: 3.00)
    invoice2.items = create(:item, price: 3.00)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(2)
  end

  scenario "when there are no favorites" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(0)
  end
end
