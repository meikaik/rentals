class Rental < ActiveRecord::Base
  has_one :user
end
