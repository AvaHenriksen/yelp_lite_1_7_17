class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  has_one    :restaurantdetail,
             :class_name => "Detail",
             :dependent => :destroy

  # Indirect associations

  has_many   :user_reviews,
             :through => :reviews,
             :source => :user

  # Validations

end
