class Shoes < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoes) do |t|
      t.column(:shoe, :string)
      t.column(:price, :money)
    end
  end
end
