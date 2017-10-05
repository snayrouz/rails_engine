require 'rails_helper'

RSpec.describe "user can get merchant's favorite customer" do
  scenario "when there is one favorite" do
    merchant = create(:merchant)
    customer1, customer2 = create_list(:customer, 2)
    invoice1, invoice2 = create_list(:invoice, 2, merchant: merchant, customer: customer1)
    invoice3 = create(:invoice, merchant: merchant, customer: customer2)
    item1, item2, item3 = create_list(:item, 3)
    invoiceitem1 = create(:invoice_item, item: item1, invoice: invoice1)
    invoiceitem2 = create(:invoice_item, item: item2, invoice: invoice2)
    invoiceitem3 = create(:invoice_item, item: item3, invoice: invoice3)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(response["id"]).to eq("#{customer1.id}")
  end

  scenario "when there are two favorites" do
    merchant = create(:merchant)
    customer1, customer2 = create_list(:customer, 2)
    invoice1 = create(:invoice, merchant: merchant, customer: customer1)
    invoice2 = create(:invoice, merchant: merchant, customer: customer2)
    item1, item2, item3 = create_list(:item, 3)
    invoiceitem1 = create(:invoice_item, item: item1, invoice: invoice1)
    invoiceitem2 = create(:invoice_item, item: item2, invoice: invoice2)
    
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
