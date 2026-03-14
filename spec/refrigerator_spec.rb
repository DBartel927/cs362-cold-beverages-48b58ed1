require_relative '../lib/refrigerator'
require_relative '../lib/chiller'
require_relative '../lib/freezer'
require_relative '../lib/item'
require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'

describe 'A refrigerator' do
  let(:chiller) { Chiller.new(30) }
  let(:freezer) { Freezer.new(20) }
  let(:reservoir) { WaterReservoir.new(10, 4) }
  let(:dispenser) { WaterDispenser.new(reservoir) }
  let(:refrigerator) { Refrigerator.new(chiller, freezer, dispenser, reservoir) }

  it 'knows its total capacity' do
    expect(refrigerator.total_capacity).to eq(50)
  end

  it 'knows its remaining capacity' do
    refrigerator.chill(Item.new('Milk', 5))
    refrigerator.freeze(Item.new('Ice Cream', 4))
    expect(refrigerator.remaining_capacity).to eq(41)
  end

  it 'adds items to the chiller' do
    refrigerator.chill(Item.new('Milk', 5))
    expect(chiller.remaining_capacity).to eq(25)
  end

  it 'adds items to the freezer' do
    refrigerator.freeze(Item.new('Ice Cream', 4))
    expect(freezer.remaining_capacity).to eq(16)
  end

  it 'sets chiller and freezer levels' do
    refrigerator.set_chiller_level(3)
    refrigerator.set_freezer_level(2)
    expect(chiller.temperature).to eq(55)
    expect(freezer.temperature).to eq(50)
  end

  it 'prints status including water information' do
    output = refrigerator.to_s
    expect(output).to include('Power: off')
    expect(output).to include('Storage: 50 of 50 available')
    expect(output).to include('Water: Reservoir has 4 remaining.')
  end
end
