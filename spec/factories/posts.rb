FactoryBot.define do
  factory :post do
    description { Faker::Lorem.sentence }
    association :user
  end

  trait :post_invalid_image do
    after(:create) do |post|
      post.images.attach(io: File.open(Rails.root.join('app/assets/images/invalid.pdf')),
                         filename: 'invalid.pdf')
    end
  end
  trait :short_description do
    description { Faker::Alphanumeric.alpha(number: 2) }
  end
  trait :long_description do
    description { Faker::Alphanumeric.alpha(number: 91) }
  end
end
