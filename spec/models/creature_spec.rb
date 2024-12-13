require 'rails_helper'

RSpec.describe Creature, type: :model do
  describe "#tick" do
    it "increases loneliness by 1 to a max of 10" do
      creature = create(:creature, loneliness: 9)

      expect { creature.tick }
        .to change { creature.reload.loneliness }
        .from(9)
        .to(10)

      expect { creature.tick }
        .to_not change { creature.reload.loneliness }
    end

    it "increases filthiness by 1 to a max of 10" do
      creature = create(:creature, filthiness: 9)

      expect { creature.tick }
        .to change { creature.filthiness }
        .from(9)
        .to(10)

      expect { creature.tick }
        .to_not change { creature.reload.filthiness }
    end

    it "increases hunger by 1 to a max of 10" do
      creature = create(:creature, hunger: 9)

      expect { creature.tick }
        .to change { creature.hunger }
        .from(9)
        .to(10)

      expect { creature.tick }
        .to_not change { creature.reload.hunger }
    end

    it "might evolve them TODO"

    it "has the chance to decrease health by 1 if stats are in danger zone" do
      creature = create(:creature, :in_danger_zone, health: 5)
      always_bad_rolls_dice_roller = DiceRoller.new(always_invoke: true)

      expect { creature.tick(dice_roller: always_bad_rolls_dice_roller) }
        .to change { creature.health }
        .from(5)
        .to(4)
    end

    it "kills the tamagotchi if your health is reduced to 0" do
      creature = create(:creature, :in_danger_zone, health: 1)
      always_bad_rolls_dice_roller = DiceRoller.new(always_invoke: true)

      expect { creature.tick(dice_roller: always_bad_rolls_dice_roller) }
        .to change { creature.health }
        .from(1)
        .to(0)

      expect(creature.status).to eq(Creature::DEAD_STATUS)
    end
  end

  describe "#feed" do
    it "decrements the hunger based on the dish" do
      creature = create(:creature, hunger: 10)
      dish = create(:dish, decrease_hunger_by: 5)

      expect { creature.feed(dish) }
        .to change { creature.hunger }.from(10).to(5)
    end

    it "cannot reduce hunger below 0" do
      creature = create(:creature, hunger: 0)
      dish = create(:dish, decrease_hunger_by: 1)

      expect { creature.feed(dish) }
        .to_not change { creature.hunger }
    end

    it "reduces hunger to 0 if meal is bigger than hunger" do
      creature = create(:creature, hunger: 2)
      dish = create(:dish, decrease_hunger_by: 100)

      expect { creature.feed(dish) }
        .to change { creature.hunger }.from(2).to(0)
    end
  end

  describe "#play" do
    it "decrements the loneliness by one" do
      creature = create(:creature, loneliness: 10)

      expect { creature.play }
        .to change { creature.loneliness }.from(10).to(9)
    end

    it "cannot reduce loneliness below 0" do
      creature = create(:creature, loneliness: 0)

      expect { creature.play }
        .to_not change { creature.hunger }
    end
  end

  describe "#clean_up" do
    it "decrements the filthiness by one" do
      creature = create(:creature, filthiness: 10)

      expect { creature.clean_up }
        .to change { creature.filthiness }.from(10).to(9)
    end

    it "cannot reduce filthiness below 0" do
      creature = create(:creature, filthiness: 0)

      expect { creature.clean_up }
        .to_not change { creature.hunger }
    end
  end
end
