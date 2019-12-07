class CreateCarToParts < ActiveRecord::Migration[6.0]
  def change
    create_table :car_to_parts do |t|
      t.integer :car, foreign_key: true, index: true
      t.integer :car_part, foreign_key: true, index: true
      t.timestamps
    end
  end
end
