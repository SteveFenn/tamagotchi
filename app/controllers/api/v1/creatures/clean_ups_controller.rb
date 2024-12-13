module Api
  module V1
    module Creatures
      class CleanUpsController < ApplicationController
        def create
          creature = Creature.find_by!(uuid: params[:creature_id])
          creature.clean_up
        end
      end
    end
  end
end
