class Book < ApplicationRecord
  belongs_to :user
  has_many :requests
  searchkick searchable: [:title], autocomplete: ['title']
  mount_uploader :picture, PhotoUploader
end
