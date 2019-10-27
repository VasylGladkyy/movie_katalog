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
