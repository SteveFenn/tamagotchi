class CreateDishes < ActiveRecord::Migration[8.0]
  def change
    create_table :dishes do |t|
      t.uuid :uuid, null: false
      t.integer :decrease_hunger_by, null: false

      t.index :uuid, unique: true
      t.timestamps
    end
  end
end
