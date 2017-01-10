class AddAddressLatitudeToDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :details, :address_latitude, :float
  end
end
