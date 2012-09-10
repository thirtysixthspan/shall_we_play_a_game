require './spec/spec_helper'

describe Board do

    context "by default" do

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

    context "when configured" do

		before :all do
			@board = Board.new(:shape => :rectangle,
							   :dimensions => [5,10])
		end

		it "should have a shape of rectangle" do
			@board.shape.should == :rectangle
		end

		it "should have two dimensions" do
			@board.dimensions.should be_a_kind_of Array
			@board.dimensions.size.should == 2
		end

		it "should have 50 positions" do
			@board.size.should == 50
		end

	end

end

