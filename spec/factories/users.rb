FactoryBot.define do
  pw = Faker::Lorem.sentence

  factory :user do
    sequence(:email){ |n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
  end
end
