require_relative '../lib/freezer'
require_relative '../lib/item'

describe 'A freezer' do
  it 'has a default capacity and room temperature' do
    freezer = Freezer.new
    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(70)
  end

  it 'can have a custom capacity' do
    freezer = Freezer.new(40)
    expect(freezer.capacity).to eq(40)
  end

  it 'tracks remaining capacity as items are added' do
    freezer = Freezer.new(10)
    freezer.add(Item.new('Ice Cream', 3))
    freezer.add(Item.new('Peas', 2))
    expect(freezer.remaining_capacity).to eq(5)
  end

  it 'changes temperature when the level is set' do
    freezer = Freezer.new
    freezer.set_level(5)
    expect(freezer.temperature).to eq(20)
  end
end
