# == Schema Information
#
# Table name: movies
#
#  id           :bigint           not null, primary key
#  actors       :text             default(" ")
#  director     :string           default(" ")
#  ganre        :string           default(" ")
#  imdbRating   :float
#  metascore    :integer
#  plot         :text             default(" ")
#  poster_url   :string
#  release_date :date
#  title        :string           default(" ")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  imdb_id      :string
#

require 'open-uri'

class Movie < ApplicationRecord
  searchkick text_middle: [:title]

  has_many :reviews, as: :reviewable, dependent: :destroy
  has_one_attached :poster_image, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy

  validates :title, :imdb_id, presence: true, uniqueness: true
  validates :ganre, 
            :release_date,
            :director,
            :actors,
            :plot,
            :poster_url,
            presence: true
  validates :imdbRating, presence: true, numericality: true
  validates :metascore, presence: true, numericality: { only_integer: true }

  before_validation do
    self.imdbRating = format_numeric_value(imdbRating)
    self.metascore = format_numeric_value(metascore)
  end

  before_save :grab_image

  def search_data
    {
      title: title
    }
  end

  def self.search_by_title(title:)
    if title
      search(title)
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
