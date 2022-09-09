FactoryBot.define do
  factory :comment do
    comment { Faker::Lorem.words(number: rand(1..4)) }
    association :user
    association :post
  end
  trait :comment_null_body do
    comment { nil }
  end
  trait :comment_short_body do
    comment { Faker::Alphanumeric.alpha(number: 2) }
  end
  trait :comment_long_body do
    comment { Faker::Alphanumeric.alpha(number: 91) }
  end
end
