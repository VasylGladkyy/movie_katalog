class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true
  has_rich_text :description

  validates :user, :reviewable, :description, presence: true
  validates :rate, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..10 }
end
