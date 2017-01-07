class AddAddressLatitudeToRestaurantdetail < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurantdetails, :address_latitude, :float
  end
end
