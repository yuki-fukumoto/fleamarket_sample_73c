FactoryBot.define do
  factory :category, class: Category do
    sequence(:id) {|n| n}
    sequence(:name) {|n| "name#{n}"}
    sequence(:ancestry) {|n| n*2}
  end
end
