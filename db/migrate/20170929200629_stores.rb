class Stores < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
      t.column(:location, :string)
    end
  end
end
