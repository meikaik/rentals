class User < ActiveRecord::Base
  has_many :rentals
  validates :email, presence: true
  validates :email, uniqueness: true
end
