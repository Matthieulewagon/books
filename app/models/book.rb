class Book < ApplicationRecord
  belongs_to :user
  searchkick searchable: [:title], autocomplete: ['title']
  mount_uploader :picture, PhotoUploader
end
