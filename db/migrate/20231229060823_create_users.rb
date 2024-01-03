class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, unique: true, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
