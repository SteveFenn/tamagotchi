module Creatures
  class Create < Dry::Operation
    def call()
      initial_evolution = step choose_initial_evolution
      creature = step create_creature(initial_evolution: initial_evolution)
      serialized_creature = step serialize_creature(creature)
      serialized_creature
    end

    def choose_initial_evolution
      Success(Evolution.babies.sample)
    end

    def create_creature(initial_evolution:)
      Success(Creature.create!(
        uuid: SecureRandom.uuid,
        current_evolution: initial_evolution
      ))
    end

    def serialize_creature(creature)
      Success({uuid: creature.uuid})
    end
  end
end
