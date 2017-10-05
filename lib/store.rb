class Store < ActiveRecord::Base
  has_many :shoesstores
  has_many :shoes, through: :shoesstores
  validates_uniqueness_of :name
  validates(:name, {:length => {:maximum => 100}, :presence => true})
end
