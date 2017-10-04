FactoryGirl.define do
  factory :item do
    sequence :name do |i|
      "MyString#{i}"
    end
    sequence :description do |i|
      "MyString#{i}"
    end
    unit_price 1
    merchant
  end
end
