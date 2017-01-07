class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  has_one    :restaurantdetail,
             :dependent => :destroy

  # Indirect associations

  has_many   :user_reviews,
             :through => :reviews,
             :source => :user

  # Validations

end
