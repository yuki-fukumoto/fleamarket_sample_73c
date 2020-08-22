FactoryBot.define do
  factory :image do
    sequence(:id) {|n| n}
    image {[ Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/_test.jpg'), 'spec/factories/_test.jpg') ]}
    association :item
  end
end
