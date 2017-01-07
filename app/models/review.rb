class Review < ApplicationRecord
  mount_uploader :photos, PhotoUploader

  # Direct associations

  belongs_to :restaurant

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
