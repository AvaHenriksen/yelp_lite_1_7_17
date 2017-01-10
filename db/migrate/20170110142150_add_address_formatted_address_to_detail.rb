class AddAddressFormattedAddressToDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :details, :address_formatted_address, :string
  end
end
