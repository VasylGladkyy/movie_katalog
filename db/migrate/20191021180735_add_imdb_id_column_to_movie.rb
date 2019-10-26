# frozen_string_literal: true

class AddImdbIdColumnToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :imdb_id, :string, unique: true
  end
end
