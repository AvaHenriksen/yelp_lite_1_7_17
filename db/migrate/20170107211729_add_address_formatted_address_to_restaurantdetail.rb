class AddAddressFormattedAddressToRestaurantdetail < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurantdetails, :address_formatted_address, :string
  end
end
