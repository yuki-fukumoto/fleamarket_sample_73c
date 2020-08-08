FactoryBot.define do
  factory :category do
    sequence(:name) {|n| "name#{n}"}
    sequence(:ancestry) {|n| n}

    trait :with_category1 do
      sequence(:ancestry) {|n| n}
    end
  end
end
