module Api
  module V1
    module Creatures
      class DishesController < ApplicationController
        def index
          Creature.find_by!(uuid: params[:creature_id])

          dishes = Dish.all
          result = dishes.map do |d|
            d.attributes.slice("uuid", "decrease_hunger_by", "name")
          end.to_json

          render json: result
        end
      end
    end
  end
end
