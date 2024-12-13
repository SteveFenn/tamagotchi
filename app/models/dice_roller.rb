class DiceRoller
  def initialize(always_invoke: false)
    @always_invoke = always_invoke
  end

  def roll(d:, succeed_on:, &block)
    if rand(d)+1 >= succeed_on || @always_invoke
      block.call
    end
  end
end
