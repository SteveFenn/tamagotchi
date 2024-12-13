module Api
  module V1
    class CreaturesController < ApplicationController
      def create
        result = resolve("creatures.create").call
        case result
        when Dry::Operation::Success
          render json: result.value!
        when Dry::Operation::Failure
          # TODO
        end
      end

      def show
        creature = Creature.find_by!(uuid: params[:uuid])
        render json: {
          uuid: creature.uuid,
          hunger: creature.hunger,
          filthiness: creature.filthiness,
          loneliness: creature.loneliness,
          health: creature.health,
          image: request.base_url + "/images/tamagotchi.gif"
        }
      end
    end
  end
end
