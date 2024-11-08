require "rails_helper"

describe "Creatures resource" do
  describe "POST /api/v1/creatures" do
    it "creates a new creature and responds with a serialized version" do
      expect { post api_v1_creatures_path }
      .to change { Creature.count }
      .by(1)
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["uuid"]).to_not be_blank
    end
  end
  
  describe "GET /api/v1/creature/:UUID" do
    it "finds a creature based on UUID and responds with a serialized version" do
      creature = create(:creature)
      get api_v1_creature_path(creature.uuid)
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["uuid"]).to_not be_blank
    end
  end
end
