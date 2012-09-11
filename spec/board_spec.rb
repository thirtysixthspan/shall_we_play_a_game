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

		it "should by default have 9 middle pieces" do
			@board.positions.select{|l,p| p.paths.size == 8 }.size.should == 9
		end		

		it "should by default have 4 corner pieces" do
			@board.positions.select{|l,p| p.paths.size == 3 }.size.should == 4
		end		

		it "should by default have 12 edge pieces" do
			@board.positions.select{|l,p| pp p.paths.size; p.paths.size == 5 }.size.should == 12
		end		

	end

    context "when configured" do

		before :each do
			pieces = []
			3.times { pieces << double(:kind_of => Piece) }
			@board = Board.new(:shape => :rectangle,
							   :dimensions => [5,10],
							   :pieces => pieces)
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

		it "should have 3 pieces" do
			@board.pieces.size.should == 3
		end

	end

end

