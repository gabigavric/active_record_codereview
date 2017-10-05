class Inventory <ActiveRecord::Base
  belongs_to :shoe
  belongs_to :store
  validates_uniqueness_of :shoe, :scope => :store
end