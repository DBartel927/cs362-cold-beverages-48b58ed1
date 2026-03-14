require_relative '../lib/chiller'
require_relative '../lib/item'

describe 'A chiller' do
  it 'has a default capacity and room temperature' do
    chiller = Chiller.new
    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(70)
  end

  it 'can have a custom capacity' do
    chiller = Chiller.new(30)
    expect(chiller.capacity).to eq(30)
  end

  it 'tracks remaining capacity as items are added' do
    chiller = Chiller.new(10)
    chiller.add(Item.new('Milk', 2))
    chiller.add(Item.new('Juice', 3))
    expect(chiller.remaining_capacity).to eq(5)
  end

  it 'changes temperature when the level is set' do
    chiller = Chiller.new
    chiller.set_level(4)
    expect(chiller.temperature).to eq(50)
  end
end
