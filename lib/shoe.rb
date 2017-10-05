class Shoe < ActiveRecord::Base
  has_many :inventories,   dependent: :destroy
  has_many :stores, through: :inventories
  validates_uniqueness_of :name
  validates(:name, {:length => {:maximum => 100}, :presence => true})

  def name=(s)
    super s.titleize
  end

end
