require 'rails_helper'

RSpec.describe "user can access most revenue" do
  scenario "with an api call" do
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)

    get "/api/v1/merchants/most_revenue?quantity=2"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(2)
  end
end
