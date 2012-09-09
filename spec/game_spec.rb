require './spec/spec_helper.rb'

describe Game do

	before :all do
		@game = Game.new()
	end

	it "should have a list of players" do
		@game.players.should be_a_kind_of Array
		@game.players.size.should be >=1 
	end

	it "should have a board" do
		@game.board.should be_a_kind_of Board
	end

	it "should have a set of rules" do
		@game.rules.should be_a_kind_of Array
	end


end

