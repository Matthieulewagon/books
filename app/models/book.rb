class Book < ApplicationRecord
  belongs_to :user
  searchkick
  mount_uploader :picture, PhotoUploader
end
