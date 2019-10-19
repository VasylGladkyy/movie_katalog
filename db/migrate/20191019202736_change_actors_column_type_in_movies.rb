class ChangeActorsColumnTypeInMovies < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :actors, :text, array: false, default: " "
  end
end
