class Movie < ApplicationRecord
  has_many :reviews, as: :reviewable

  validates :title, presence: true #unique
  validates :ganre, :release_date, :director, :actors, :plot, presence: true
  validates :imdbRating, presence: true, numericality: true
  validates :metascore, presence: true, numericality: { only_integer: true }
end
