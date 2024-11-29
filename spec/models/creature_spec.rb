require 'rails_helper'

RSpec.describe Creature, type: :model do
  describe "#feed!" do
    it "decrements the hunger based on the dish" do
      creature = create(:creature, hunger: 10)
      dish = create(:dish, decrease_hunger_by: 5)

      expect { creature.feed!(dish) }
        .to change { creature.hunger }.from(10).to(5)
    end

    it "cannot reduce hunger below 0" do
      creature = create(:creature, hunger: 0)
      dish = create(:dish, decrease_hunger_by: 1)

      expect { creature.feed!(dish) }
        .to_not change { creature.hunger }
    end

    it "reduces hunger to 0 if meal is bigger than hunger" do
      creature = create(:creature, hunger: 2)
      dish = create(:dish, decrease_hunger_by: 100)

      expect { creature.feed!(dish) }
        .to change { creature.hunger }.from(2).to(0)
    end
  end
end