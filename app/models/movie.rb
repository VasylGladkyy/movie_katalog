class Movie < ApplicationRecord
  has_many :reviews, as: :reviewable
end
