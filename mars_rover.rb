class MarsRover
  @@orientation_number_map = { "N"  => 1, "W" => 2, "S" => 3, "E" => 4 }
  @@number_orientation_map = {  1 => "N", 2 => "W", 3 => "S" , 4 => "E" }

  attr_reader :orientation, :orientation_number
  
  def initialize(position, limit=[5,5])
    @x_coordinate = position[:coordinates][0];
    @y_coordinate = position[:coordinates][1];
    @orientation = position[:orientation];
    @orientation_number =  @@orientation_number_map[orientation];
    @y_coordinate_lower_limit = 0
    @x_coordinate_lower_limit = 0
    @x_coordinate_upper_limit = limit[0]
    @y_coordinate_upper_limit = limit[1]
  end
  
  
  def coordinates
    [@x_coordinate, @y_coordinate]
  end
  
  def turn(direction)
    turn_right if direction == "R"
    turn_left if direction == "L"
  end
  
  def turn_right
    update_orientation_number(+1);
    update_orientation
  end
  
  def turn_left
    update_orientation_number(-1);
    update_orientation
  end
  
  def update_orientation_number(direction_additive)
    @orientation_number += direction_additive
    @orientation_number = 4 if @orientation_number < 1
    @orientation_number = 1 if @orientation_number > 4
  end
  
  def update_orientation
    @orientation = @@number_orientation_map[@orientation_number]
  end
  
  def move
    if @orientation == "E" or @orientation == "W"
      move_sideways
    else
      move_front_or_back
    end
  end
  
  
  def move_sideways
    unless @x_coordinate == @x_coordinate_upper_limit
      @x_coordinate += 1 if @orientation == "W"
    end
    unless  @x_coordinate == @x_coordinate_lower_limit
      @x_coordinate -= 1 if @orientation == "E"
    end
  end
  
  
  def move_front_or_back
    unless @y_coordinate == @y_coordinate_upper_limit
      @y_coordinate += 1 if @orientation == "N"
    end
    unless @y_coordinate == @y_coordinate_lower_limit
      @y_coordinate -= 1 if @orientation == "S"
    end
  end
  
end