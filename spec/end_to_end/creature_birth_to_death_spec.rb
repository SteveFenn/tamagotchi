require "rails_helper"

describe "The world deamon ticking a creature to death" do
  it "kills the creature" do
    creature = create(:creature, hunger: 0)

    WorldDaemon.new(sleep_time: 0, run_for: 10).run

    expect(creature.reload.status).to eq(Creature::DEAD_STATUS)
  end

  it "evolves a creature every hour, and kills it when it is fully evolved" do
    piglet = create(:evolution, name: "Piglet", life_span_in_minutes: 60)
    pig = create(:evolution, name: "Pig", life_span_in_minutes: 60)
    mecha_pig = create(:evolution, name: "Mecha Pig", life_span_in_minutes: 60)
    piglet.children << pig
    pig.children << mecha_pig
    creature = create(:creature, current_evolution: piglet)
    daemon = WorldDaemon.new(sleep_time: 0)

    travel_to 1.hour.from_now + 1.minute
    daemon.tick_world
    expect(creature.reload.current_evolution).to eq(pig)

    travel_to 2.hours.from_now + 1.minute
    daemon.tick_world
    expect(creature.reload.current_evolution).to eq(mecha_pig)

    travel_to 3.hours.from_now + 1.minute
    daemon.tick_world
    expect(creature.reload.status).to eq(Creature::DEAD_STATUS)
  end
end
