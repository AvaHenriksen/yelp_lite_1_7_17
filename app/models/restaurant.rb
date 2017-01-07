class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  has_one    :restaurantdetail,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
