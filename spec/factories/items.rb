FactoryGirl.define do
  factory :item do
    name "MyString"
    description "MyString"
    unit_price 1
    merchant
    created_at "2017-10-03 10:10:10"
    updated_at "2017-10-03 10:10:20"
  end
end
