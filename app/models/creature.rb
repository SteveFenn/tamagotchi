class Creature < ApplicationRecord
  ALLOWED_STATUSES = [
    ALIVE_STATUS="alive",
    DEAD_STATUS="dead",
  ].map(&:freeze).freeze

  validates :hunger, numericality: { only_integer: true, in: 0..10 }
  validates :status, inclusion: { in: ALLOWED_STATUSES }

  belongs_to :current_evolution, class_name: "Evolution"

  def tick(dice_roller: DiceRoller.new)
    increment!(:loneliness) unless loneliness == 10
    increment!(:filthiness) unless filthiness == 10
    increment!(:hunger) unless hunger == 10

    if in_danger_zone?
      dice_roller.roll(d: 6, succeed_on: 4) do
        decrement!(:health)
        if health == 0
          die!
        end
      end
    end

    # evolve
    evolution_threshold = evolution_comparison_timestamp +
      current_evolution.life_span_in_minutes.minutes

    if Time.now > evolution_threshold
      evolve_or_die!
    end
  end

  def feed(dish)
    return update!(hunger: 0) if dish.decrease_hunger_by > hunger
    decrement!(:hunger, dish.decrease_hunger_by)
  end

  def play
    return if loneliness == 0
    decrement!(:loneliness)
  end

  def clean_up
    return if filthiness == 0
    decrement!(:filthiness)
  end

  private

  def in_danger_zone?
    attrs = [hunger, loneliness, filthiness]
    (attrs.sum / attrs.size.to_f) > 8
  end

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

  def evolve_or_die!
    return die! if current_evolution.children.none?
    evolve!
  end
end
