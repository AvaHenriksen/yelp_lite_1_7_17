class AddAddressLongitudeToRestaurantdetail < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurantdetails, :address_longitude, :float
  end
end
