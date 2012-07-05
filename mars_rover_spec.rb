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
  end
  
  
  describe 'Orientation,' do
     context 'when facing North,' do
       before(:each) do
          position = { :coordinates => [0,0], :orientation => "N"}
          @rover = MarsRover.new(position);
       end
       
       it 'should change to West when commanded R' do
          @rover.turn('R')
          @rover.orientation.should eq('W')
       end
       
       it 'should change to East When commanded L' do
         @rover.turn('L')
         @rover.orientation.should eq('E')
       end 
     end
     
     context 'when facing west,' do
       before(:each) do
         position = { :coordinates => [0,0], :orientation => "W"}
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
       
       it 'should change to East when commanded R' do
         @rover.turn('R')
         @rover.orientation.should eq('E')
       end
       
       it 'should change to West When commanded L' do
         @rover.turn('L')
         @rover.orientation.should eq('W')
       end 
       
     end
     
     context 'when facing East,' do
       before(:each) do
         position = { :coordinates => [0,0], :orientation => "E"}
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
        @rover.coordinates.should eq([0,1])                
      end
    end
    
    context 'current facing west' do
      it "should be moving towards south when commanded" do
        position = { :coordinates => [1,1], :orientation => "W"}
        @rover = MarsRover.new(position);
        @rover.move
        @rover.coordinates.should eq([2,1])        
      end
    end
  end  
end
