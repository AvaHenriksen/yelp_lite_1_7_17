class Restaurantdetail < ApplicationRecord
  mount_uploader :cover_photo, CoverPhotoUploader

  # Direct associations

  belongs_to :restaurant

  # Indirect associations

  # Validations

end
