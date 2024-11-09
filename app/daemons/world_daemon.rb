class WorldDaemon
  attr_reader :sleep_time, :run_for
  attr_accessor :current_loop

  def initialize(sleep_time: 1, run_for: nil)
    @sleep_time = sleep_time
    @run_for = run_for
    @current_loop = 1
  end

  def run
    loop do
      tick_world
      if run_for
        break if current_loop == run_for
        self.current_loop += 1
      end
      sleep sleep_time
    end
  end

  def tick_world
    Creature.all.find_each(&:tick)
  end
end