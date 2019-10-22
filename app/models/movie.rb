class Movie < ApplicationRecord
  has_many :reviews, as: :reviewable

  validates :title, :imdb_id, presence: true, uniqueness: true
  validates :ganre, :release_date, :director, :actors, :plot, presence: true
  validates :imdbRating, presence: true, numericality: true
  validates :metascore, presence: true, numericality: { only_integer: true }

  def self.search(title:)
    if title
      where('title LIKE ?', "%#{title}%")
    else
      all
    end
  end
end