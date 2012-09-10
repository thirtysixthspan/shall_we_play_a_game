require './spec/spec_helper.rb'

describe Game do

    context "by default" do

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

    context "when configured" do

		before :each do
			board = double(:kind_of? => Board, :shape => :square)
			players = []
			players << double(:kind_of? => Player, :name => 'Jane Doe', :color => :white)
			players << double(:kind_of? => Player, :name => 'John Doe', :color => :black)
			rules = []
			rules << double(:kind_of? => Rule)
			rules << double(:kind_of? => Rule)
			rules << double(:kind_of? => Rule)
  			@game = Game.new( :name => 'Chess', 
  							  :players => players, 
  							  :rules => rules, 
  							  :board => board)
  		end

		it "should have a list of players" do
			@game.players.should be_a_kind_of Array
			@game.players.size.should be == 2
			@game.players.first.should be_a_kind_of Player
		end

		it "should have a square board" do
			@game.board.should be_a_kind_of Board
			@game.board.shape.should == :square
		end

		it "should have a set of rules" do
			@game.rules.should be_a_kind_of Array
			@game.rules.size.should == 3
			@game.rules.first.should be_a_kind_of Rule
		end

		it "should have a name" do
			@game.name.should == 'Chess'
		end

	end

end

