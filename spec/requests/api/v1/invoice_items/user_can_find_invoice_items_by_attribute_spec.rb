require 'rails_helper'

RSpec.describe "user can find invoice_item by attribute" do
  scenario "with single query" do
    invoice_item1 = create(:invoice_item, unit_price: 4)
    invoice_item2 = create(:invoice_item, unit_price: 5)

    get "/api/v1/invoice_items/find?unit_price=4"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(invoice_item1.id)
    expect(result["item_id"]).to eq(invoice_item1.item_id)
    expect(result["invoice_id"]).to eq(invoice_item1.invoice_id)
    expect(result["quantity"]).to eq(invoice_item1.quantity)
    expect(result["unit_price"]).to eq(invoice_item1.unit_price)
  end

  scenario "with multiple queries" do
    invoice_item1 = create(:invoice_item, unit_price: 4, id: 4)
    invoice_item2 = create(:invoice_item, unit_price: 4)

    get "/api/v1/invoice_items/find?id=4&unit_price=4"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(invoice_item.id)
    expect(result["item_id"]).to eq(invoice_item.item_id)
    expect(result["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(result["quantity"]).to eq(invoice_item1.quantity)
    expect(result["unit_price"]).to eq(invoice_item.unit_price)
  end

  scenario "with no results" do
    invoice_item1 = create(:invoice_item, unit_price: 5, id: 4)
    invoice_item2 = create(:invoice_item, unit_price: 4, id: 1)

    get "/api/v1/invoice_items/find?id=4&unit_price=4"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.count).to eq(0)
    expect(response["id"]).to eq(nil)
  end

end
