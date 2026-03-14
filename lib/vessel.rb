class Vessel
  attr_reader :name, :volume, :current_volume

  def initialize(name = 'FAKE', volume = 100)
    @name = name
    @volume = volume
    @current_volume = 0
  end

  def empty?
    @current_volume == 0
  end

  def fill(amount = volume)
    @current_volume = [current_volume + amount, volume].min
  end

  def remaining_capacity
    volume - current_volume
  end
end
