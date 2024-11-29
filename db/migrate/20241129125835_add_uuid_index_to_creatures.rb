class AddUuidIndexToCreatures < ActiveRecord::Migration[8.0]
  def change
    add_index :creatures, :uuid, unique: true
  end
end
