module Api
  module V1
    module Creatures
      class PlayTimesController < ApplicationController
        def create
          creature = Creature.find_by!(uuid: params[:creature_id])
          creature.play
        end
      end
    end
  end
end