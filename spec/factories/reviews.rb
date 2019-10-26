# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    rate { 10 }
    description { Faker::Company.bs }
    user { build(:user) }
    reviewable { build(:movie) }
  end
end
