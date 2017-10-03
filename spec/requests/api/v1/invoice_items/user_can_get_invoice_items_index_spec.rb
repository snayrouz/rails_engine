require 'rails_helper'

RSpec.describe "user can get invoice_items index" do
  it "by calling api" do
    invoice_item = create_list(:invoice_item, 4)

    get "/api/v1/invoice_items"
    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(4)
    expect(result[3]["id"]).to eq(invoice_item[3].id)
    expect(result[0]["invoice_id"]).to eq(invoice_item[0].invoice_id)
    expect(result[1]["item_id"]).to eq(invoice_item[1].item_id)
    expect(result[2]["quantity"]).to eq(invoice_item[2].quantity)
    expect(result[3]["unit_price"]).to eq(invoice_item[3].unit_price)
  end
end
