class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  validates :user, :reviewable, :description, presence: true
  validates :rate, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..10 }

  has_rich_text :text
end
