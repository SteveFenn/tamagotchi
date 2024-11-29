class AddLastEvolvedAtToCreatures < ActiveRecord::Migration[8.0]
  def change
    add_column :creatures, :last_evolved_at, :datetime, null: true
  end
end
