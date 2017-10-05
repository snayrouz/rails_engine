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
<<<<<<< HEAD
=======
    created_at "2017-10-03 10:10:10"
    updated_at "2017-10-03 10:10:20"
>>>>>>> 800022b8cb85433dc22a7646a9a1319c3f1b142a
  end
end
