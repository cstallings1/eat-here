class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :user_id
      t.string :name
      t.string :location
      t.string :rating
      t.string :phone
      t.string :url
      t.string :img_url
      t.float :lat, {:precision=>10, :scale=>6}
      t.float :lon, {:precision=>10, :scale=>6}

      t.timestamps(null: false)
    end
  end
end
