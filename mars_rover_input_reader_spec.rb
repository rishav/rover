require "./mars_rover_input_processor"
describe MarsRoverInputProcessor do
  it "initialize" do
    ARGV.should_receive(:first).and_return("./runner_file.txt")    
    processor = MarsRoverInputProcessor.new
    processor.run
    processor.filename.should eq("./runner_file.txt")
    processor.upper_limits.should eq([5,5])
    processor.rovers.count.should eq(3)  
  end
  
end