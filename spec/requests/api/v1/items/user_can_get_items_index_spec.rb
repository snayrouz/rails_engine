require 'rails_helper'

RSpec.describe "user can get items index" do
  it "by calling api" do
    item = create_list(:item, 4)

    get "/api/v1/items"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(4)
    expect(result[3]["id"]).to eq(item[3].id)
    expect(result[0]["name"]).to eq(item[0].name)
    expect(result[2]["unit_price"]).to eq(item[2].unit_price)
  end
end
