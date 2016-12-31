class Book < ApplicationRecord
  belongs_to :user
  searchkick
end
