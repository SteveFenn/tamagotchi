require "rails_helper"

describe "Creature PlayTime resources" do
  describe "POST /api/v1/creatures/:id/play_times" do
    it "plays with creature and decreases its loneliness" do
      creature = create(:creature, loneliness: 10)

      post api_v1_creature_play_times_path(creature.uuid)
      expect(response).to have_http_status(:success)

      expect(creature.reload.loneliness).to be < 10
    end

    it "explodes if the creature doesn't exist" do
      post api_v1_creature_play_times_path("non-existing-creature-id")
      expect(response).to have_http_status(:not_found)
    end

    it "returns JSON with an image of the play time" do
      creature = create(:creature)

      post api_v1_creature_play_times_path(creature.uuid)

      expect(parsed_response).to include({
        image: be_a(String)
      })
    end
  end
end
