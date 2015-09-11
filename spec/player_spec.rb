require 'player'

  # can lose
  # can place ships /
  # can tell us when a ship is hit /
  # can report hit positions /
  # can report miss positions /
  # will lose if all ships are hit

describe Player do

  it { is_expected.to respond_to(:place).with(3).arguments }

  it 'can place ship in chosen position' do
    ship = Ship.new
    player = Player.new
    player.place(ship, 'A1', :N)
    expect(ship.ship_positions).to eq('A1')
  end

  it 'can report hit positions' do
    ship = Ship.new
    player = Player.new
    player.hits = ("A1")
    expect(player.hits).to eq(["A1"])
  end

  it 'can report missed positions' do
    ship = Ship.new
    player = Player.new
    player.misses = ("A2")
    expect(player.misses).to eq(["A2"])
  end

  it 'can be told when a ship is hit' do
    ship = Ship.new
    player = Player.new
    player.place(ship, 'A1', :N)
    allow(player).to receive(:receive_hit).and_return :hit
    expect(player.receive_hit('A1')).to eq(:hit)
  end

  it 'tells player they have lost if all ships are hit' do
    ship = Ship.new
    player = Player.new
    player.receive_hit("A1")
    expect(player.lost?).to eq(true)
  end

  it 'can report if all ships have been sunk' do
    ship = Ship.new
    player = Player.new
    player.place(ship, 'A1', :N)
    allow(player).to receive(:receive_hit).and_return :all_ships_sunk
    expect(player.receive_hit('A1')).to eq(:all_ships_sunk)
  end



end
