class MovieBlueprint < Blueprinter::Base
  identifier :id
  
  fields :title, :ganre, :release_date, :director, :actors, :plot, :metascore, :imdbRating, :imdb_id, :poster_url

end