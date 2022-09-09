FactoryBot.define do
  factory :story do
    description { Faker::Lorem.words(number: rand(1...4)) }
    link_to_default_image = Rails.root.join('app/assets/images/jpegg.jpeg')
    storyimage { Rack::Test::UploadedFile.new link_to_default_image, 'jpegg.jpeg' }
    association :user
  end
  trait :story_invalid_image do
    after(:create) do |story|
      story.storyimage.attach(io: File.open(Rails.root.join('app/assets/images/invalid.pdf')),
                              filename: 'invalid.pdf')
    end
  end
end
