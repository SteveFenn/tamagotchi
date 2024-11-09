class Creature < ApplicationRecord
  ALLOWED_STATUSES = [
    ALIVE_STATUS="alive",
    DEAD_STATUS="dead",
  ].map(&:freeze).freeze
  
  validates :hunger, numericality: { only_integer: true, in: 0..10 }
  validates :status, inclusion: { in: ALLOWED_STATUSES }
  
  def tick
    increment!(:hunger)
    if hunger == 10
      die!
    end
  end

  def die!
    update!(status: DEAD_STATUS)
  end
end
