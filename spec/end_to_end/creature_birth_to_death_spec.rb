require "rails_helper"

describe "The world deamon ticking a creature to death" do
  it "kills the creature" do
    creature = create(:creature, hunger: 0)

    WorldDaemon.new(sleep_time: 0, run_for: 10).run

    expect(creature.reload.status).to eq(Creature::DEAD_STATUS)
  end
end