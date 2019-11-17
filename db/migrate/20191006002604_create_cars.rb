class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :vin
      t.integer :make

      t.timestamps
    end
  end
end
