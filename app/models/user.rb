class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :requests_as_buyer, class_name: 'Request', foreign_key: 'buyer_id'
  has_many :requests_as_seller, class_name: 'Request', foreign_key: 'seller_id'
  has_many :books

end
