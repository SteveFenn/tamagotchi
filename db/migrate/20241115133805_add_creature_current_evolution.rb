class AddCreatureCurrentEvolution < ActiveRecord::Migration[8.0]
  def change
    add_column :creatures, :current_evolution_id, :bigint, null: false
  end
end
