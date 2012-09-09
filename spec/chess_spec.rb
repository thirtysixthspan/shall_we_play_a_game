require './spec/spec_helper.rb'

describe Chess do

	before :all do
		@chess = Chess.new()
	end

	it "should have two players" do
		@chess.players.should be_a_kind_of Array
		@chess.players.size.should be == 2 
	end

	it "should have one player playing :white and one player playing :black" do
		@chess.players.first.color.should == :white 
		@chess.players.second.color.should == :black 
	end

	it "cannot have the same player on both sides" do
		@chess.players.first.name.should_not == @chess.players.second.name 
	end	

	it "should have an 8 by 8 board" do
		@chess.board.should be_a_kind_of Board
		@chess.board.size.should be == 64

	end

	it "should have a set of rules" do
		@chess.rules.should be_a_kind_of Array
	end


end

