class Album < ActiveRecord::Base
  has_many :photos
  has_many :permissions
  has_many :users, through: :permissions
end
