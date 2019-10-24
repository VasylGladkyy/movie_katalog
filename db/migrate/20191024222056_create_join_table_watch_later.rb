class CreateJoinTableWatchLater < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :movies do |t|
      t.index :user_id
      t.index :movie_id
    end
  end
end
