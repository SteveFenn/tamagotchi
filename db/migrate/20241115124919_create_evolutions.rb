class CreateEvolutions < ActiveRecord::Migration[8.0]
  def change
    create_table :evolutions do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :evolution_transitions do |t|
      t.belongs_to :parent_evolution, null: false
      t.belongs_to :child_evolution, null: false
      t.timestamps
    end
  end
end
