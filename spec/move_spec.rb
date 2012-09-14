require './spec/spec_helper'

describe Move do

	context "by default" do

		before :all do
			@move = Move.new(:direction => [1,1], :occupation => 3)
		end

		it "should have direction" do
			@move.direction.should == [1,1]
		end

		it "should have occupation" do
			@move.occupation.should == 3
		end

		it "should raise execption when no direction is provided" do
			lambda {@move = Move.new()}.should raise_exception 
		end

		it "should raise execption when a null direction is provided" do
			lambda {@move = Move.new(:direction=>[0,0])}.should raise_exception 
		end

	end

end

