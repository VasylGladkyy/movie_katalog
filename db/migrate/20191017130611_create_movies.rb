# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, default: ' '
      t.string :ganre, default: ' '
      t.date :release_date
      t.string :director, default: ' '
      t.text :actors, array: true, default: []
      t.text :plot, default: ' '
      t.integer :metascore
      t.float :imdbRating

      t.timestamps
    end
  end
end
