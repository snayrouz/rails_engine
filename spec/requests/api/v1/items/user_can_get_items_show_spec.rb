require 'rails_helper'

RSpec.describe "user can get item show" do
  scenario "by calling api" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(item.id)
    expect(result["name"]).to eq(item.name)
    expect(result["description"]).to eq(item.description)
    expect(result["unit_price"]).to eq(item.unit_price)
  end
end
