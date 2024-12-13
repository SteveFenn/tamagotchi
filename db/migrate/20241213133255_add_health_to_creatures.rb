class AddHealthToCreatures < ActiveRecord::Migration[8.0]
  def change
    change_table :creatures do |t|
      t.integer :health, default: 5, null: false
    end
  end
end
