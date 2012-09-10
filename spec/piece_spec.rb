require './spec/spec_helper'

describe Piece do

	context "by default" do

		before :all do
			@piece = Piece.new()
		end

		it "should have no position" do
			@piece.position.should == nil
		end

		it "should have a color of :white" do
			@piece.color.should == :white
		end

		it "should have a role of :uno" do
			@piece.role.should == :uno
		end

		it "should have no name" do
			@piece.name.should == nil
		end	

		it "should have no moves" do
			@piece.moves.should == []
		end	
	end

	context "when configured" do

		before :all do
			moves = [ [+1,+2,3], [+2,+1,3],
					  [-1,+2,3], [-2,+1,3],
					  [+1,-2,3], [+2,-1,3],
					  [-1,-2,3], [-2,-1,3] ]

			@piece = Piece.new( :name => 'N',
								:role => :knight,
								:color => :black,
								:position => 'QN1',
								:moves => moves)
		end

		it "should have a position" do
			@piece.position.should be_a_kind_of String
			@piece.position.should == 'QN1'
		end

		it "should have a color of :black" do
			@piece.color.should == :black
		end

		it "should have a role of :knight" do
			@piece.role.should == :knight
		end

		it "should have a name of N" do
			@piece.name.should == 'N'
		end			

		it "should have 8 moves" do
			@piece.moves.size.should == 8
		end

		it "should have moves that are triples" do
			@piece.moves.map{|m| m.size == 3}.inject(:&).should == true
		end

	end

end

