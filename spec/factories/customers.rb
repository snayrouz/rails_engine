FactoryGirl.define do
  factory :customer do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    created_at "2017-10-03 10:10:10"
    updated_at "2017-10-03 10:10:20"
  end
end
