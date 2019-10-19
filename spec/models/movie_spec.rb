require 'rails_helper'

RSpec.describe Movie, type: :model do
  before do
    @title = "Legend"
    @ganre = "Biography, Crime, Drama, Thriller"
    @release_date = Date.current
    @director = "Brian Helgeland"
    @actors = "Paul Anderson, Tom Hardy, Christopher Eccleston, Joshua Hill"
    @plot = "Identical twin gangsters Ronald and Reginald Kray terrorize London during the 1960s."
    @imdbRating = 6.9
    @metascore = 55
    @movie = Movie.create(
        title: @title,
        ganre: @ganre,
        release_date: @release_date,
        director: @director,
        actors: @actors,
        plot: @plot,
        imdbRating: @imdbRating,
        metascore: @metascore )
  end

  it "is valid with valid atributes" do
    expect(@movie).to be_valid
  end

  describe "not valid without invalid atributes" do
    it "is not valid without a title" do
      expect(Movie.create(
          title: nil,
          ganre: @ganre,
          release_date: @release_date,
          director: @director,
          actors: @actors,
          plot: @plot,
          imdbRating: @imdbRating,
          metascore: @metascore
      )).not_to be_valid
    end

    it "is not valid without a ganre" do
      expect(Movie.create(
          title: @title,
          ganre: nil,
          release_date: @release_date,
          director: @director,
          actors: @actors,
          plot: @plot,
          imdbRating: @imdbRating,
          metascore: @metascore
      )).not_to be_valid
    end
    
    it "is not valid without a release_date" do
      expect(Movie.create(
          title: @title,
          ganre: @ganre,
          release_date: nil,
          director: @director,
          actors: @actors,
          plot: @plot,
          imdbRating: @imdbRating,
          metascore: @metascore
      )).not_to be_valid
    end

    it "is not valid without a release_date" do
      expect(Movie.create(
          title: @title,
          ganre: @ganre,
          release_date: nil,
          director: @director,
          actors: @actors,
          plot: @plot,
          imdbRating: @imdbRating,
          metascore: @metascore
      )).not_to be_valid
    end
    
    it "is not valid without a director" do
      expect(Movie.create(
          title: @title,
          ganre: @ganre,
          release_date: @release_date,
          director: nil,
          actors: @actors,
          plot: @plot,
          imdbRating: @imdbRating,
          metascore: @metascore
      )).not_to be_valid
    end
    
    it "is not valid without a actors" do
      expect(Movie.create(
          title: @title,
          ganre: @ganre,
          release_date: @release_date,
          director: @director,
          actors: nil,
          plot: @plot,
          imdbRating: @imdbRating,
          metascore: @metascore
      )).not_to be_valid
    end
    
    it "is not valid without a plot" do
      expect(Movie.create(
          title: @title,
          ganre: @ganre,
          release_date: @release_date,
          director: @director,
          actors: @plot,
          plot: nil,
          imdbRating: @imdbRating,
          metascore: @metascore
      )).not_to be_valid
    end
    
    it "is not valid without a imdbRating" do
      expect(Movie.create(
          title: @title,
          ganre: @ganre,
          release_date: @release_date,
          director: @director,
          actors: @plot,
          plot: @plot,
          imdbRating: nil,
          metascore: @metascore
      )).not_to be_valid
    end

    it "is not valid without a metascore" do
      expect(Movie.create(
          title: @title,
          ganre: @ganre,
          release_date: @release_date,
          director: @director,
          actors: @plot,
          plot: @plot,
          imdbRating: @imdbRating,
          metascore: nil
      )).not_to be_valid
    end

    it "is not if metascope  gets double value" do
      expect(Movie.create(
          title: @title,
          ganre: @ganre,
          release_date: @release_date,
          director: @director,
          actors: @plot,
          plot: @plot,
          imdbRating: @imdbRating,
          metascore: 2.5
      )).not_to be_valid
    end
  end
end
