require 'rails_helper'

RSpec.describe "user can find item by attribute" do
  scenario "with single query" do
    item1 = create(:item, unit_price: 4)
    item2 = create(:item, unit_price: 5)

    get "/api/v1/items/find?unit_price=4"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(item1.id)
    expect(result["name"]).to eq(item1.name)
    expect(result["description"]).to eq(item1.description)
    expect(result["unit_price"]).to eq(item1.unit_price)
  end

  scenario "with multiple queries" do
    item1 = create(:item, unit_price: 4, id: 4)
    item2 = create(:item, unit_price: 4)

    get "/api/v1/items/find?id=4&unit_price=4"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(item.id)
    expect(result["name"]).to eq(item.name)
    expect(result["description"]).to eq(item.description)
    expect(result["unit_price"]).to eq(item.unit_price)
  end

  scenario "with no results" do
    item1 = create(:item, unit_price: 5, id: 4)
    item2 = create(:item, unit_price: 4, id: 1)

    get "/api/v1/items/find?id=4&unit_price=4"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.count).to eq(0)
    expect(response["id"]).to eq(nil)
  end

end
