require './spec/spec_helper.rb'

describe Chess do

	context "starting a new game" do

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

		it "should have two kings" do
			@chess.pieces.select {|p| p.role == :king }.size.should == 2
		end

		it "should have two players with 16 pieces each" do
			@chess.players.first.pieces.size == 16
			@chess.players.second.pieces.size == 16
		end

		it "should have pieces that can each move" do
			@chess.pieces.map{|p| p.moves.size > 0 }.inject(:&).should == true 
		end

		it "it should be white's move" do
			@chess.whos_move.should == @chess.white
		end

		it "should be able to query a valid move" do
			pending "unimplemented"
			@chess.allowed_move?('P-K3').should == true 
		end

		it "should be able to query an invalid pawn move" do
			pending "unimplemented"
			@chess.allowed_move?('P-K5').should == true 
		end

	end

	context "making moves" do

		before :each do
			@chess = Chess.new()
		end

		it "should permit advancing a white pawn one space" do
			@chess.move('P-K3').should == true 
		end

		it "players should take turns moving" do
			@chess.move('P-K3')
			@chess.whos_move.should == @chess.black 
			@chess.move('P-K3')
			@chess.whos_move.should == @chess.white 
			@chess.move('P-Q4')
			@chess.whos_move.should == @chess.black 
			@chess.move('P-Q4')
			@chess.whos_move.should == @chess.white 
		end

    end

end

