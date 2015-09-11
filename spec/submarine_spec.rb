require 'player'
require 'submarine'

describe Submarine do
  it 'should have size 2' do
    expect(subject.size_of_ship).to eq(2)
  end

  context 'direction' do

    it 'knows all positions when facing north' do
      submarine = Submarine.new
      player = Player.new
      player.place(submarine, 'A2', :N)
      expect(player.positions_taken(submarine, 'A2', :N)).to eq(['A2','A1'])
    end

  end
end
