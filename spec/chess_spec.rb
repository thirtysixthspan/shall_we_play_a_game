require './spec/spec_helper.rb'

describe Chess do

	context "parsing descriptive notation" do

		before :each do
			@chess = Chess.new()
		end

		it "should correctly report the role of a piece" do
			role, position = @chess.parse('P-K4')
			role.should == :pawn
		end

		it "should raise an exception when an invalid piece is provided in description" do
			lambda {@chess.parse('T-K4')}.should raise_exception 
		end

		it "should raise an exception when an invalid piece is provided in capture description" do
			pending("unimplemented")
			lambda {@chess.parse('PxT')}.should raise_exception 
		end

		it "should raise an exception when an invalid location is provided in the description" do
			lambda {@chess.parse('P-QQ1')}.should raise_exception 
		end

		it "should correctly report the position of a piece for white" do
			@chess.whites_move
			position = @chess.get_position(:white,'K4')
			position.location.should == [3,4]
		end

		it "should correctly report the position of a piece for black" do
			@chess.blacks_move
			position = @chess.get_position(:black,'K4')
			position.location.should == [4,4]
		end

		it "should correctly report the new position of a moving piece for white" do
			@chess.whites_move
			role, position = @chess.parse('P-K4')
			position.location.should == [3,4]
		end

		it "should correctly report the new position of a moving piece for black" do
			@chess.blacks_move
			role, position = @chess.parse('P-K4')
			position.location.should == [4,4]
		end

	end

	context "starting a new game" do

		before :each do
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

		it "should by default have 36 middle pieces" do
			@chess.board.positions.select{|l,p| p.paths.size == 8 }.size.should == 36
		end		

		it "should by default have 4 corner pieces" do
			@chess.board.positions.select{|l,p| p.paths.size == 3 }.size.should == 4
		end		

		it "should by default have 24 edge pieces" do
			@chess.board.positions.select{|l,p| p.paths.size == 5 }.size.should == 24
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
			@chess.allowed_move?('P-K3').should == true 
		end

		it "should be able to query an invalid pawn move" do
			@chess.allowed_move?('P-K5').should == false 
		end

	end

	context "making opening moves" do

		before :each do
			@chess = Chess.new()
		end

		it "should permit advancing a white pawn one space" do
			@chess.move('P-K3').should == true 
		end

		it "players should take turns moving" do
			@chess.move('P-K3').should == true
			@chess.whites_move?.should == false 
			@chess.blacks_move?.should == true
			@chess.move('P-K3').should == true
			@chess.whites_move?.should == true
			@chess.blacks_move?.should == false 
		end

    end

end

