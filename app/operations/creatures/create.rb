module Creatures
  class Create < Dry::Operation
    def call()
      creature = step create_creature
      serialized_creature = step serialize_creature(creature)
      serialized_creature
    end
    
    def create_creature
      Success(Creature.create!(uuid: SecureRandom.uuid))
    end
    
    def serialize_creature(creature)
      Success({uuid: creature.uuid})
    end
  end
end