class EvolutionTransition < ApplicationRecord
  belongs_to :parent_evolution, class_name: "Evolution"
  belongs_to :child_evolution, class_name: "Evolution"
end