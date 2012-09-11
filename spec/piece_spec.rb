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

		before :each do
			moves = [ [+1,0,3], [+2,+0,3] ]

			@position1 = double(:kind_of? => Piece)		  	
			@position2 = double(:kind_of? => Piece, :paths => {[+1,+2] => @position1})	  	
			@position2.stub(:along).and_return(@position1)

			@piece = Piece.new( :name => 'P',
								:role => :pawn,
								:color => :black,
								:position => @position2,
								:moves => moves)
		end

		it "should have a position" do
			@piece.position.should be_a_kind_of Piece
			@piece.position.should == @position2
		end

		it "should have a color of :black" do
			@piece.color.should == :black
		end

		it "should have a role of :pawn" do
			@piece.role.should == :pawn
		end

		it "should have a name of P" do
			@piece.name.should == 'P'
		end			

		it "should have 2 moves" do
			@piece.moves.size.should == 2
		end

		it "should have moves that are triples" do
			@piece.moves.map{|m| m.size == 3}.inject(:&).should == true
		end

		it "should permit moving to position1 from position2" do
			@piece.move_to?(@position1,1)	
		end

	end

end

