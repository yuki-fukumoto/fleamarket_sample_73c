FactoryBot.define do
  factory :image do
    image {"MyString"}
    # image {[ Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/_test.jpg'), 'spec/factories/_test.jpg') ]}

  end
end
