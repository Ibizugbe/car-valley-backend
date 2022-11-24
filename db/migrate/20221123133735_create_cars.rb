class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :model,     null: false, unique: true, index: true
      t.string :color,     null: false
      t.integer :price,    null: false
      t.text :description, null: false
      t.date :release_date, null: false
      

      t.timestamps
    end
  end
end
