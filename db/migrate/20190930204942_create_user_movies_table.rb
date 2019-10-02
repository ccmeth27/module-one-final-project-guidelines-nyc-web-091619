class CreateUserMoviesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_movies do |t|
      t.integer :user_id
      t.integer :movie_id
      t.boolean :watchlist, default: false
      t.boolean :rejected, default: false
      t.integer :rating
      t.timestamps
    end
  end
end
