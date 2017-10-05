class InitialDatabase < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
      t.timestamps
    end
    create_table(:shoes) do |t|
      t.column(:name, :string)
      t.column(:price, :money, default: 0)
      t.timestamps
    end
    create_table(:inventories) do |t|
      t.belongs_to :store, index: true
      t.belongs_to :shoe, index: true
      t.timestamps
    end
  end
end