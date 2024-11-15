class AddTimeToEvolveToEvolutions < ActiveRecord::Migration[8.0]
  def change
    add_column :evolutions, :life_span_in_minutes, :int, null: false, default: 60
  end
end
