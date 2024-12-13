require "rails_helper"

describe "Creature Meals resource" do
  describe "POST /api/v1/creatures/:id/meals" do
    it "creates a meal and feeds it to the creature" do
      creature = create(:creature, hunger: 10)
      dish = create(:dish, decrease_hunger_by: 5)

      post api_v1_creature_meals_path(creature.uuid, dish_id: dish.uuid)
      expect(response).to have_http_status(:success)

      expect(creature.reload.hunger).to eq(5)
    end

    it "explodes if the dish doesn't exist" do
      creature = create(:creature)

      post api_v1_creature_meals_path(creature.uuid, dish_id: "non-existing-dish-id")
      expect(response).to have_http_status(:not_found)
    end

    it "explodes if the creature doesn't exist" do
      dish = create(:dish)

      post api_v1_creature_meals_path("non-existing-creature-id", dish_id: dish.uuid)
      expect(response).to have_http_status(:not_found)
    end
  end
end
