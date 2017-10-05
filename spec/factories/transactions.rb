FactoryGirl.define do
  factory :transaction do
<<<<<<< HEAD
    invoice
    credit_card_number 1
    credit_card_expiration_date 1
    result "dun"
=======
    credit_card_number { Faker::Number.number(10) }
    credit_card_expiration_date { Faker::Date.between(2.years.ago, Date.today) }
    result 'success'
    invoice
>>>>>>> 800022b8cb85433dc22a7646a9a1319c3f1b142a
  end
end
