class CreateCarToParts < ActiveRecord::Migration[6.0]
  def change
    create_table :car_to_parts do |t|

      t.timestamps
    end
  end
end
