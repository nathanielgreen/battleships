require_relative 'ship'

class Board

  attr_accessor :ships, :ship

  def initialize
    @ships = []
  end

  def place(ship)
   if ships.empty?
     @ships << ship
   else
     fail 'Ship placed on the same space' if already_taken?(ship)
     @ships << ship
   end
 end

  def receive_hit(hit_position)
    @ships.each do |ship|
      if ship.position == hit_position
         ship.hit = true
         ships.delete(ship)
         ship.get_hit
         if ship.hit_counter < ship.size
            return :hit
          else
            return :sunk
          end
       else
          return :miss
      end
    end
  end

  def all_sunk?
    @ships.each do |ship|
      return false if ship.hit == false
    end
    true
  end

def already_taken?(ship)
  if ships.include?(ship)
    fail 'testing error'
  else
    return 'test'
  end
end




end


























# def initialize(size=5)
#     @board = []
#     size.times { @board << false }
#   end

#   def place_on_board(ship, location)
#     limit = location + (ship.ship_size-1)
#     for i in location..limit
#       @board[i] = true
#     end
#   end

#   def has_a_ship?(location)
#     @board[location]
#   end

#   def board_size
#     @board.count
#   end
