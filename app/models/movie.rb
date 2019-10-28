require 'open-uri'

class Movie < ApplicationRecord
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_one_attached :poster_image, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy

  validates :title, :imdb_id, presence: true, uniqueness: true
  validates :ganre, :release_date, :director, :actors, :plot, :poster_url, presence: true
  validates :imdbRating, presence: true, numericality: true
  validates :metascore, presence: true, numericality: { only_integer: true }

  before_validation do
    self.imdbRating = format_numeric_value(imdbRating)
    self.metascore = format_numeric_value(metascore)
  end

  before_save :grab_image

  def self.search(title:)
    if title
      where('title LIKE ?', "%#{title}%")
    else
      order(imdbRating: :desc)
    end
  end

  private

  def grab_image
    downloaded_image = open(poster_url)
    poster_image.attach(io: downloaded_image, filename: title)
  end

  def format_numeric_value(value)
    value.is_a?(Numeric) ? value : 0
  end
end
