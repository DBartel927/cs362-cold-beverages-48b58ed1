require_relative '../lib/item'

describe 'An item of food or a beverage' do
  it 'has a name and volume' do
    item = Item.new('Juice', 3)
    expect(item.name).to eq('Juice')
    expect(item.volume).to eq(3)
  end
end
