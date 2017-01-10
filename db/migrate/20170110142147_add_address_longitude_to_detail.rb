class AddAddressLongitudeToDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :details, :address_longitude, :float
  end
end
