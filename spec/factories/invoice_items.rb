FactoryGirl.define do
  factory :invoice_item do
    item
    invoice
    unit_price 50
    quantity 1000
    created_at "2017-10-03 10:10:10"
    updated_at "2017-10-03 10:10:20"
  end
end
