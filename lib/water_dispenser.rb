class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    amount = reservoir.drain(vessel.remaining_capacity)
    vessel.fill(amount)
    amount
  end

end
