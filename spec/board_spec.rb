require './spec/spec_helper'

describe Board do

	before :all do
		@board = Board.new()
	end

	it "should have a default shape of square" do
		@board.shape.should == :square
	end

	it "should by default only have one dimension" do
		@board.dimensions.should be_a_kind_of Array
		@board.dimensions.size.should == 1
	end

	it "should by default have 25 positions" do
		@board.size.should == 25
	end

end

