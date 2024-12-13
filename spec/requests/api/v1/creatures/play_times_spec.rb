require "rails_helper"

describe "Creature PlayTime resources" do
  describe "POST /api/v1/creatures/:id/play_times" do
    it "plays with creature and decreases its loneliness" do
      creature = create(:creature, loneliness: 10)

      post api_v1_creature_play_times_path(creature.uuid)
      expect(response).to be_successful

      expect(creature.reload.loneliness).to be < 10
    end

    it "explodes if the creature doesn't exist" do
      post api_v1_creature_play_times_path("non-existing-creature-id")
      expect(response).to be_not_found
    end
  end
end
