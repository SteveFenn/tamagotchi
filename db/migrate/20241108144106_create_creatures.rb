class CreateCreatures < ActiveRecord::Migration[8.0]
  def change
    create_table :creatures do |t|
      t.string :uuid, null: false
      t.string :status, default: "alive", null: false
      t.integer :hunger, default: 0, null: false
      t.timestamps
    end
  end
end
