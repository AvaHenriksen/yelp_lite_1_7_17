class Restaurant < ApplicationRecord
  # Direct associations

  has_one    :restaurantdetail,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
