require "rails_helper"

describe "Creature CleanUp resources" do
  describe "POST /api/v1/creatures/:id/clean_ups" do
    it "cleans the creature and decreases its filthiness" do
      creature = create(:creature, filthiness: 10)

      post api_v1_creature_clean_ups_path(creature.uuid)
      expect(response).to be_successful

      expect(creature.reload.filthiness).to be < 10
    end

    it "explodes if the creature doesn't exist" do
      post api_v1_creature_clean_ups_path("non-existing-creature-id")
      expect(response).to be_not_found
    end
  end
end