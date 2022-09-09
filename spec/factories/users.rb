FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    fullname { Faker::Name.first_name }
    username { Faker::Alphanumeric.alpha(number: 15) + (Time.now.day + Time.now.hour + Time.now.min + Time.now.sec).to_s }
    trait :null_email do
      email { nil }
    end
    trait :null_password do
      password { nil }
    end
    trait :short_password do
      password { Faker::Alphanumeric.alpha(number: 3) }
    end
    trait :short_username do
      username { Faker::Alphanumeric.alpha(number: 1) }
    end
    trait :long_username do
      username { Faker::Alphanumeric.alpha(number: 26) }
    end
    trait :short_fullname do
      fullname { Faker::Alphanumeric.alpha(number: 1) }
    end
    trait :long_fullname do
      fullname { Faker::Alphanumeric.alpha(number: 26) }
    end
    trait :invalid_fullname do
      fullname { Faker::Alphanumeric.alphanumeric(number: 20) }
    end
    trait :invalid_image do
      after(:create) do |user|
        user.profile_pic.attach(io: File.open(Rails.root.join('app/assets/images/invalid.pdf')),
                                filename: 'invalid.pdf')
      end
    end
  end
end
