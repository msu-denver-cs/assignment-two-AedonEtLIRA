class CreateCarParts < ActiveRecord::Migration[6.0]
  def change
    create_table :car_parts do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
