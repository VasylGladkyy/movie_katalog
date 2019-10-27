require 'rails_helper'

RSpec.describe Movie, type: :model do
  before do
    @title = Faker::Company.bs
    @ganre = 'Biography, Crime, Drama, Thriller'
    @release_date = Date.current
    @director = 'Brian Helgeland'
    @actors = 'Paul Anderson, Tom Hardy, Christopher Eccleston, Joshua Hill'
    @plot = 'Identical twin gangsters Ronald and Reginald Kray terrorize London during the 1960s.'
    @imdbRating = 6.9
    @metascore = 55
    @imdb_id = Faker::Company.bs
    @poster_url = Faker::Avatar.image
    @movie = Movie.create(
      title: @title,
      ganre: @ganre,
      release_date: @release_date,
      director: @director,
      actors: @actors,
      plot: @plot,
      imdbRating: @imdbRating,
      metascore: @metascore,
      imdb_id: @imdb_id,
      poster_url: Faker::Avatar.image
    )
  end

  it 'is valid with valid atributes' do
    expect(@movie).to be_valid
  end

  describe 'not valid without invalid atributes' do
    context 'if title have not valid data' do
      it 'is not valid without a title' do
        expect(Movie.create(
                 title: nil,
                 ganre: @ganre,
                 release_date: @release_date,
                 director: @director,
                 actors: @actors,
                 plot: @plot,
                 imdbRating: @imdbRating,
                 metascore: @metascore,
                 imdb_id: Faker::Company.bs
               )).not_to be_valid
      end

      it 'is not valid if title not unig' do
        expect(Movie.create(
                 title: @title,
                 ganre: @ganre,
                 release_date: @release_date,
                 director: @director,
                 actors: @actors,
                 plot: @plot,
                 imdbRating: @imdbRating,
                 metascore: @metascore,
                 imdb_id: Faker::Company.bs
               )).not_to be_valid
      end
    end

    it 'is not valid without a ganre' do
      expect(Movie.create(
               title: Faker::Company.bs,
               ganre: nil,
               release_date: @release_date,
               director: @director,
               actors: @actors,
               plot: @plot,
               imdbRating: @imdbRating,
               metascore: @metascore,
               imdb_id: Faker::Company.bs
             )).not_to be_valid
    end

    it 'is not valid without a release_date' do
      expect(Movie.create(
               title: Faker::Company.bs,
               ganre: @ganre,
               release_date: nil,
               director: @director,
               actors: @actors,
               plot: @plot,
               imdbRating: @imdbRating,
               metascore: @metascore,
               imdb_id: Faker::Company.bs
             )).not_to be_valid
    end

    it 'is not valid without a release_date' do
      expect(Movie.create(
               title: Faker::Company.bs,
               ganre: @ganre,
               release_date: nil,
               director: @director,
               actors: @actors,
               plot: @plot,
               imdbRating: @imdbRating,
               metascore: @metascore,
               imdb_id: Faker::Company.bs
             )).not_to be_valid
    end

    it 'is not valid without a director' do
      expect(Movie.create(
               title: Faker::Company.bs,
               ganre: @ganre,
               release_date: @release_date,
               director: nil,
               actors: @actors,
               plot: @plot,
               imdbRating: @imdbRating,
               metascore: @metascore,
               imdb_id: Faker::Company.bs
             )).not_to be_valid
    end

    it 'is not valid without a actors' do
      expect(Movie.create(
               title: Faker::Company.bs,
               ganre: @ganre,
               release_date: @release_date,
               director: @director,
               actors: nil,
               plot: @plot,
               imdbRating: @imdbRating,
               metascore: @metascore,
               imdb_id: Faker::Company.bs
             )).not_to be_valid
    end

    it 'is not valid without a plot' do
      expect(Movie.create(
               title: Faker::Company.bs,
               ganre: @ganre,
               release_date: @release_date,
               director: @director,
               actors: @plot,
               plot: nil,
               imdbRating: @imdbRating,
               metascore: @metascore,
               imdb_id: Faker::Company.bs
             )).not_to be_valid
    end

    it 'is not valid without a imdbRating' do
      expect(Movie.create(
               title: Faker::Company.bs,
               ganre: @ganre,
               release_date: @release_date,
               director: @director,
               actors: @plot,
               plot: @plot,
               imdbRating: nil,
               metascore: @metascore,
               imdb_id: Faker::Company.bs
             )).not_to be_valid
    end

    it 'is not valid without a metascore' do
      expect(Movie.create(
               title: Faker::Company.bs,
               ganre: @ganre,
               release_date: @release_date,
               director: @director,
               actors: @plot,
               plot: @plot,
               imdbRating: @imdbRating,
               metascore: nil,
               imdb_id: Faker::Company.bs
             )).not_to be_valid
    end

    it 'is not if metascope  gets double value' do
      expect(Movie.create(
               title: Faker::Company.bs,
               ganre: @ganre,
               release_date: @release_date,
               director: @director,
               actors: @plot,
               plot: @plot,
               imdbRating: @imdbRating,
               metascore: 2.5,
               imdb_id: Faker::Company.bs
             )).not_to be_valid
    end

    context 'if title have not valid data' do
      it 'if imdb_id is nil' do
        expect(Movie.create(
                 title: Faker::Company.bs,
                 ganre: @ganre,
                 release_date: @release_date,
                 director: @director,
                 actors: @plot,
                 plot: @plot,
                 imdbRating: @imdbRating,
                 metascore: 2.5,
                 imdb_id: Faker::Company.bs
               )).not_to be_valid
      end

      it 'if imdb_id is not unig' do
        expect(Movie.create(
                 title: Faker::Company.bs,
                 ganre: @ganre,
                 release_date: @release_date,
                 director: @director,
                 actors: @plot,
                 plot: @plot,
                 imdbRating: @imdbRating,
                 metascore: 2.5,
                 imdb_id: @imdb_id
               )).not_to be_valid
      end
    end
  end

  describe 'associations tests' do
    it 'have many reviews' do
      movie = Movie.reflect_on_association(:reviews)
      expect(movie.macro).to eq(:has_many)
    end
  end

  describe 'Search method test' do
    it 'back movie object' do
      movie = Movie.search(title: @title)
      expect(movie).to eq([@movie])
    end
  end
end
