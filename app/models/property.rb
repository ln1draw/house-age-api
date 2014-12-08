class Property < ActiveRecord::Base
  validates :address, uniqueness: true
end
