FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { Faker::String.random(length: 8) }
    nickname { Faker::Name.first_name }
    role { 'customer' }
  end

  factory :admin, parent: :user do
    role { 'admin' }
  end
end
