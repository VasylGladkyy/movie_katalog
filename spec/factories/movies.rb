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

FactoryBot.define do
  factory :movie do
    title { Faker::Company.bs }
    ganre { Faker::Company.bs }
    release_date { Date.current }
    director { Faker::Name.name }
    actors { Faker::Company.bs }
    plot { Faker::Company.bs }
    imdbRating { 25 }
    metascore { 10 }
    imdb_id { Faker::Company.bs }
    poster_url { Faker::Avatar.image }
  end
end
