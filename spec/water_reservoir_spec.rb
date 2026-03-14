require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  it 'has a capacity and current water volume' do
    reservoir = WaterReservoir.new(10, 4)

    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(4)
  end

  it 'can be empty' do
    reservoir = WaterReservoir.new(10, 0)

    expect(reservoir).to be_empty
  end

  it 'fills to capacity' do
    reservoir = WaterReservoir.new(10, 0)

    reservoir.fill

    expect(reservoir.current_water_volume).to eq(10)
  end

  it 'drains water' do
    reservoir = WaterReservoir.new(10, 7)

    drained = reservoir.drain(3)

    expect(drained).to eq(3)
    expect(reservoir.current_water_volume).to eq(4)
  end

  it 'never goes negative when drained past empty' do
    reservoir = WaterReservoir.new(10, 2)

    drained = reservoir.drain(5)

    expect(drained).to eq(2)
    expect(reservoir.current_water_volume).to eq(0)
  end
end
