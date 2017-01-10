class Book < ApplicationRecord
  belongs_to :user
  has_many :requests
  searchkick searchable: [:title], language: "french"
  mount_uploader :picture, PhotoUploader
end
