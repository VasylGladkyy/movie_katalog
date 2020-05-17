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

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true
  has_rich_text :description

  validates :user, :reviewable, :description, presence: true
  validates :rate, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..10 }
end
