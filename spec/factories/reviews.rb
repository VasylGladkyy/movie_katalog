# == Schema Information
#
# Table name: reviews
#
#  id              :bigint           not null, primary key
#  rate            :integer          default(0)
#  reviewable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  reviewable_id   :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_reviews_on_reviewable_type_and_reviewable_id  (reviewable_type,reviewable_id)
#  index_reviews_on_user_id                            (user_id)
#

FactoryBot.define do
  factory :review do
    rate { 10 }
    description { Faker::Company.bs }
    user { build(:user) }
    reviewable { build(:movie) }
  end
end
