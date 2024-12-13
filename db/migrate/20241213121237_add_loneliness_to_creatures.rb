class AddLonelinessToCreatures < ActiveRecord::Migration[8.0]
  def change
    change_table :creatures do |t|
      t.integer :loneliness, default: 0, null: false
    end
  end
end
