require './mars_rover.rb'
class MarsRoverInputProcessor
  attr_reader :filename,:rovers, :upper_limits
  
  def initialize
    @filename = ARGV.first
    @rovers = []
    @upper_limits   
  end
  
  def run
    file = File.open(@filename)
    lines = []
    file.each { |line| lines << line }
    @upper_limits = lines[0].split(' ').map { |limit| limit.to_i }
    setup_rovers(lines)
    @rovers.each do |rover|
      puts rover.position_and_orientation
    end
  end
    
  def setup_rovers(lines)

    lines[1..lines.length].each_slice(2) do |rover_input|
      rover = MarsRover.create_from_line_input(rover_input[0], @upper_limits)

      rover_command = rover_input[1].gsub("\n", "")
      rover.process_command(rover_command)

      @rovers << rover
    end    
  end
  
  
  
end

