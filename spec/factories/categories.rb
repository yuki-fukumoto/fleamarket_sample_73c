FactoryBot.define do
  factory :category do
    sequence(:name) {|n| "name#{n}"}
    ancestry {"1/2/3"}
  end
end
