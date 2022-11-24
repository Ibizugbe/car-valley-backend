class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username,     null: false, unique: true, index: true
      t.string :password_digest
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :dob, null: false


      t.timestamps
    end
  end
end
