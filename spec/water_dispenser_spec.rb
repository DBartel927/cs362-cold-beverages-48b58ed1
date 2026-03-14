require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'
require_relative '../lib/vessel'

describe 'A water dispenser' do
  it 'has a reservoir' do
    reservoir = WaterReservoir.new(10, 5)
    dispenser = WaterDispenser.new(reservoir)

    expect(dispenser.reservoir).to eq(reservoir)
  end

  it 'dispenses water from the reservoir based on vessel volume' do
    reservoir = WaterReservoir.new(10, 8)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Cup', 3)

    dispenser.dispense(vessel)

    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'fills the vessel when dispensing' do
    reservoir = WaterReservoir.new(10, 8)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Cup', 3)

    dispenser.dispense(vessel)

    expect(vessel.current_volume).to eq(3)
    expect(vessel).not_to be_empty
  end

  it 'does not over-drain the reservoir and only partially fills a vessel if needed' do
    reservoir = WaterReservoir.new(10, 2)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Cup', 3)

    dispenser.dispense(vessel)

    expect(reservoir.current_water_volume).to eq(0)
    expect(vessel.current_volume).to eq(2)
  end
end
