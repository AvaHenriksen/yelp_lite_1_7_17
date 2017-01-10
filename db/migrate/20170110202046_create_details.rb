class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :restaurant_id
      t.text :description
      t.string :address
      t.string :website
      t.string :cover_photo

      t.timestamps

    end
  end
end
