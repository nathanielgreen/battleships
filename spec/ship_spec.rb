require 'ship'

#   has a position when created /
#   can be hit
#   will record number of hits
#   can be missed
#   will not be hit when it is missed
#   is not sunk initially /
#   can be sunk

describe Ship do

  let(:player) { Player.new }

  it 'should not be initially sunk' do
    ship = Ship.new
    expect(ship.hit_counter).to eq(0)
  end

  it 'will record number of hits' do
    ship = Ship.new
    player = Player.new
    player.place(ship, 'A1', :N)
    player.receive_hit('A1')
    expect(ship.hit_counter).to eq(1)
  end

  it 'wont record hit if missed' do
    ship = Ship.new
    player = Player.new
    player.place(ship, 'A1', :N)
    player.receive_hit('A2')
    expect(ship.hit_counter).to eq(0)
  end

  it 'can be sunk' do
    ship = Ship.new
    player = Player.new
    player.place(ship, 'A1', :N)
    allow(player).to receive(:receive_hit).and_return :sunk
    expect(player.receive_hit('A1')).to eq(:sunk)
  end


end




























 # it 'should have a default size' do
 #    expect(subject.ship_size).to eq(1)
 #  end
