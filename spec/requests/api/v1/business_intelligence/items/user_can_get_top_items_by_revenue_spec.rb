require 'rails_helper'

RSpec.describe "user can get top items" do
  scenario "top three" do
    item1, item2, item3 = create_list(:item, 3)
    invoice_item1 = create(:invoice_item, quantity: 4, unit_price: 2, item: item1)
    invoice_item2 = create(:invoice_item, quantity: 2, unit_price: 1.5, item: item2)

    get "/api/v1/items/most_revenue?quantity=3"
    result = JSON.parse(response.body)
    binding.pry

    expect(response).to be_success
    expect(result.count).to eq(3)
    expect(result[0]["id"]).to eq(item1.id)
    expect(result[1]["id"]).to eq(item2.id)
    expect(result[2]["id"]).to eq(item3.id)
  end

  scenario "top two" do
    item1, item2 = create_list(:item, 2)
    invoice_item1 = create(:invoice_item, quantity: 4, unit_price: 2, item: item1)
    invoice_item2 = create(:invoice_item, quantity: 2, unit_price: 1.5, item: item2)

    get "/api/v1/items/most_revenue?quantity=2"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(2)
    expect(result[0]["id"]).to eq(item1.id)
    expect(result[1]["id"]).to eq(item2.id)
  end

end
