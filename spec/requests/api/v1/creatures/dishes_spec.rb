require "rails_helper"

describe "Creature Dishes resource" do
  describe "GET /api/v1/creatures/:id/dishes" do
    it "returns a list of all dishes" do
      create(:dish, name: "burger", decrease_hunger_by: 1)
      create(:dish, name: "chips", decrease_hunger_by: 2)
      creature = create(:creature)

      get api_v1_creature_dishes_path(creature.uuid)

      expect(response).to have_http_status(:success)
      expect(parsed_response.size).to eq(2)
      expect(parsed_response.first).to include(name: "burger", decrease_hunger_by: 1)
      expect(parsed_response.second).to include(name: "chips", decrease_hunger_by: 2)
    end

    it "explodes if a creature does not exist" do
      create(:dish)

      get api_v1_creature_dishes_path("non-existing-creature-uuid")

      expect(response).to have_http_status(:not_found)
    end
  end
end
