require_relative 'ship'
require_relative 'submarine'

class Player

  attr_accessor :ship_positions, :ships, :ship

  def initialize
    @ships = []
    @hits = []
    @misses = []
    @positions = []
  end

  def place_ship(ship, position, orientation)
    if @positions.include?(position)
      return 'There\'s a ship already there'
    else
      @positions << position
      @ships << ship
      @ships.each do |ship|
        ship.ship_positions << position

      end
    end
  end

  def receive_hit(coords)
    if @positions.include?(coords)
       @positions.delete(coords)
       @ships.each do |ship|
         ship.get_hit if ship.ship_positions.include?(coords)
         if ship.hit_counter == ship.size_of_ship
           :sunk
           @hits << coords
         else
           :hit
           @hits << coords
         end
       end
     else
       :miss
       @misses << coords
     end
  end


  def hits=(position)
    hits << position
  end

  def misses=(position)
    misses << position
  end


  def positions_taken(ship, start_pos, orientation)
    ship_size = ship.size_of_ship
    start_pos_split = start_pos.chars
    positions_taken_array = []
    case orientation
    when :N, :S
      if orientation == :N
        y = start_pos_split.pop.to_i
        y -= 1
        positions_taken_array << start_pos_split.push(y.to_s).join
      end
        @positions << positions_taken_array
        @positions.flatten!
        positions_taken_array
      end



  end

end
