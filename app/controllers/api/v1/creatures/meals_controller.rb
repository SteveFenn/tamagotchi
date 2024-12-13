module Api
  module V1
    module Creatures
      class MealsController < ApplicationController
        def create
          creature = Creature.find_by!(uuid: params[:creature_id])
          dish = Dish.find_by!(uuid: params[:dish_id])
          creature.feed(dish)

          render json: {
            image: request.base_url + "/images/tamagotchi.gif"
          }
        end
      end
    end
  end
end
