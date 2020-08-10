FactoryBot.define do
  factory :creditcard do
    sequence(:id) {|n| n}
    customer_id {"cus_xxx"}
    card_id {"car_xxx"}
    association :user
  end
end
