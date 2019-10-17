class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :ganre
      t.date :year
      t.string :director
      t.text :actors
      t.text :plot
      t.text :poster_img

      t.timestamps
    end
  end
end
