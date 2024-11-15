class Evolution < ApplicationRecord
  has_many :parent_transitions, 
    class_name: "EvolutionTransition",
    foreign_key: "child_evolution_id",
    dependent: :destroy
  has_many :parents, 
    through: :parent_transitions, 
    class_name: "Evolution",
    source: :parent_evolution
  has_many :child_transitions, 
    class_name: "EvolutionTransition",
    foreign_key: "parent_evolution_id", 
    dependent: :destroy
  has_many :children, 
    through: :child_transitions, 
    class_name: "Evolution",
    source: :child_evolution

  has_many :creatures, foreign_key: :current_evolution_id

  scope :babies, -> { where.missing(:parents) }
end
