FactoryBot.define do
  factory :item do
    sequence(:id) {|n| "#{n}"}
    name {"留魂録"}
    explanation {"力作です"}
    price {1800}
    condition {"damaged"}
    shipping_pay {"exhibitor"}
    shipping_area {"yamaguchi"}
    shipping_period {"days1_2"}
    association :category
    association :user
  end
end
