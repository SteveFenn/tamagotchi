class Creature < ApplicationRecord
  ALLOWED_STATUSES = [
    ALIVE_STATUS="alive",
    DEAD_STATUS="dead",
  ].map(&:freeze).freeze

  validates :hunger, numericality: { only_integer: true, in: 0..10 }
  validates :status, inclusion: { in: ALLOWED_STATUSES }

  belongs_to :current_evolution, class_name: "Evolution"

  def tick
    # hunger
    increment!(:hunger)
    if hunger == 10
      die!
    end

    # evolve
    evolution_threshold = evolution_comparison_timestamp + 
      current_evolution.life_span_in_minutes.minutes
    
    if Time.now > evolution_threshold
      evolve_or_die!
    end
  end

  def evolve_or_die!
    return die! if current_evolution.children.none?
    evolve!
  end

  private

  def evolve!
    update!(
      current_evolution: current_evolution.children.sample,
      last_evolved_at: Time.now
    )
  end

  def die!
    update!(status: DEAD_STATUS)
  end

  def evolution_comparison_timestamp
    last_evolved_at || created_at
  end
end
