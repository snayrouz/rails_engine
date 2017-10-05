FactoryGirl.define do
  factory :invoice do
    customer
    merchant
<<<<<<< HEAD
    status "resting"
=======
    status "shipped"

    trait :with_transactions do
      transient do
        transaction_count 3
      end

      after(:create) do |invoice, evaluator|
        invoice.transactions << create_list(:transaction, evaluator.transaction_count)
      end
    end

    trait :with_invoice_items do
      transient do
        invoice_item_count 3
      end

      after(:create) do |invoice, evaluator|
        invoice.invoice_items << create_list(:invoice_item, evaluator.invoice_item_count)
      end
    end
>>>>>>> 800022b8cb85433dc22a7646a9a1319c3f1b142a
  end
end
