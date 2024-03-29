require './mars_rover.rb'
describe MarsRover do 
  
  describe "Initialization" do 
    before(:each) do
      position = { :coordinates => [0,0], :orientation => "N"}
      @rover = MarsRover.new(position);
    end
    it 'should have coordinates' do      
      @rover.coordinates.should eq([0,0])
    end

    it 'should have position/orientation' do
      @rover.orientation.should eq('N')
      @rover.orientation_number.should eq(1)
    end
    
    it 'should be created from simple line input' do
      rover = MarsRover.create_from_line_input("1 1 N", [5,5])
      rover.orientation.should eq('N')
      rover.orientation_number.should eq(1)
      rover.coordinates.should eq([1,1])
    end
  end
  
  
  describe 'Orientation,' do
     context 'when facing North,' do
       before(:each) do
          position = { :coordinates => [0,0], :orientation => "N"}
          @rover = MarsRover.new(position);
       end
       
       it 'should change to East when commanded R' do
          @rover.turn('R')
          @rover.orientation.should eq('E')
       end
       
       it 'should change to West When commanded L' do
         @rover.turn('L')
         @rover.orientation.should eq('W')
       end 
     end
     
     context 'when facing east,' do
       before(:each) do
         position = { :coordinates => [0,0], :orientation => "E"}
         @rover = MarsRover.new(position);
       end
       it 'should change to South when commanded R' do
         @rover.turn('R')
         @rover.orientation.should eq('S')
       end
       
       it 'should change to North When commanded L' do
         @rover.turn('L')
         @rover.orientation.should eq('N')
       end 
       
     end
     
     context 'when facing South,' do
       
       before(:each) do
         position = { :coordinates => [0,0], :orientation => "S"}
         @rover = MarsRover.new(position);
       end
       
       it 'should change to West when commanded R' do
         @rover.turn('R')
         @rover.orientation.should eq('W')
       end
       
       it 'should change to West When commanded L' do
         @rover.turn('L')
         @rover.orientation.should eq('E')
       end
       
     end
     
     context 'when facing West,' do
       before(:each) do
         position = { :coordinates => [0,0], :orientation => "W"}
         @rover = MarsRover.new(position);
       end
       
       it 'should change to North when commanded R' do
         @rover.turn('R')
         @rover.orientation.should eq('N')
       end
       
       it 'should change to South When commanded L' do
         @rover.turn('L')
         @rover.orientation.should eq('S')
       end
     end
     
  end
  
  describe "Rover Movement" do
    
    context 'current facing north' do
      it "should be moving towards north when commanded" do
        position = { :coordinates => [1,1], :orientation => "N"}
        @rover = MarsRover.new(position);
        @rover.move
        @rover.coordinates.should eq([1,2])
      end      
    end
    
    context 'current facing south' do
      it "should be moving towards south when commanded" do
        position = { :coordinates => [1,1], :orientation => "S"}
        @rover = MarsRover.new(position);
        @rover.move
        @rover.coordinates.should eq([1,0])        
      end
    end
    
    context 'current facing east' do
      it "should be moving towards east when commanded" do
        position = { :coordinates => [1,1], :orientation => "E"}
        @rover = MarsRover.new(position);
        @rover.move
        @rover.coordinates.should eq([2,1])                
      end
    end
    
    context 'current facing west' do
      it "should be moving towards south when commanded" do
        position = { :coordinates => [1,1], :orientation => "W"}
        @rover = MarsRover.new(position);
        @rover.move
        @rover.coordinates.should eq([0,1])        
      end
    end
    
    context "with upperlimit/lowerlimit" do
      it "shouldn't move north" do
        position = { :coordinates => [1,5], :orientation => "N"}
        @rover = MarsRover.new(position, [5,5]);
        @rover.move
        @rover.move
        @rover.coordinates.should eq([1,5])                
      end
      
      it "shouldn't move south" do
        position = { :coordinates => [1,0], :orientation => "S"}
        @rover = MarsRover.new(position, [5,5]);
        @rover.move
        @rover.move
        @rover.coordinates.should eq([1,0])                
      end
      
      it "shouldn't move east" do
        position = { :coordinates => [5,1], :orientation => "E"}
        @rover = MarsRover.new(position, [5,5]);
        @rover.move
        @rover.move
        @rover.coordinates.should eq([5,1])                
      end
      
      it "shouldn't move west" do
        position = { :coordinates => [0,1], :orientation => "W"}
        @rover = MarsRover.new(position, [5,5]);
        @rover.move
        @rover.move
        @rover.coordinates.should eq([0,1])                
      end      
    end
  end 
  
  describe "should process command" do 
    it "should move according to given test case 1 " do
      position = { :coordinates => [1,2], :orientation => "N"}
      @rover = MarsRover.new(position, [5,5]);
      @rover.process_command("LMLMLMLMM")
      @rover.position_and_orientation.should eq("1 3 N")      
    end
    
    it "should move according to given test case 2 " do
      position = { :coordinates => [3,3], :orientation => "E"}
      @rover = MarsRover.new(position, [5,5]);
      @rover.process_command("MMRMMRMRRM")
      @rover.position_and_orientation.should eq("5 1 E")      
    end
    
  end 
  
end
