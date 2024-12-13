require 'rails_helper'

RSpec.describe Creature, type: :model do
  describe "#tick" do
    it "works" do
      raise("TODO")
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
