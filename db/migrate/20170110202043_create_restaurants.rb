class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.text :restaurant_name
      t.string :tag
      t.integer :average_rating

      t.timestamps

    end
  end
end
