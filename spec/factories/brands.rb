FactoryBot.define do
  factory :brand do
    sequence(:id) {|n| "#{n}"}
    sequence(:name) {|n| "name#{n}"}
  end
end
