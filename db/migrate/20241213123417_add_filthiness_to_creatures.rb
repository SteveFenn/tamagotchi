class AddFilthinessToCreatures < ActiveRecord::Migration[8.0]
  def change
    change_table :creatures do |t|
      t.integer :filthiness, default: 0, null: false
    end
  end
end
