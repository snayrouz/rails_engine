FactoryGirl.define do
  factory :invoice do
    customer
    merchant
    status "resting"
  end
end
