class Store < ActiveRecord::Base
  has_many :inventories,   dependent: :destroy
  has_many :shoes, through: :inventories
  validates_uniqueness_of :name
  validates(:name, {:length => {:maximum => 100}, :presence => true})
end
