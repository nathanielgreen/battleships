class Ship

  attr_accessor :ship_positions, :hit, :orientation
  attr_reader :hit_counter, :size_of_ship, :ship_positions

  def initialize
    @ship_positions = []
    @hit_counter = 0
    @size_of_ship = 1
  end

  def get_hit
    @hit_counter += 1
  end

  def ship_positions
    @ship_positions
  end








end

# attr_reader :ship_size

#   def initialize(size=1)
#     @ship_size = size
#   end
