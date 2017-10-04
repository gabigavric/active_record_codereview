class InitialDatabase < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
    end
    create_table(:shoe) do |t|
      t.column(:name, :string)
      t.column(:price, :money, default: 0)
    end
    create_table(:shoes_stores) do |t|
      t.column(:store_id, :integer)
      t.column(:shoe_id, :integer)
    end
  end
end
