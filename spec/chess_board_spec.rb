require './spec/spec_helper'

describe ChessBoard do

    context "by default" do

		before :all do
			@board = ChessBoard.new()
		end

		it "should have a default shape of square" do
			@board.shape.should == :square
		end

		it "should by default only have one dimension of 8" do
			@board.dimensions.should be_a_kind_of Array
			@board.dimensions.size.should == 1
			@board.dimensions.first.should == 8
		end

		it "should by default have 64 positions" do
			@board.size.should == 64
		end

	end

    context "when provided pieces" do

		before :each do
			pieces = []
			5.times { pieces << double(:kind_of => Piece, :position => 'C', :color => :white) }
			12.times { pieces << double(:kind_of => Piece, :position => 'C', :color => :black) }
			pieces << double(:kind_of => Piece, :position => 'QR1', :color => :white)
			pieces << double(:kind_of => Piece, :position => 'QB5', :color => :white)
			pieces << double(:kind_of => Piece, :position => 'Q1', :color => :white)
			pieces << double(:kind_of => Piece, :position => 'KB3', :color => :black)
			@board = ChessBoard.new(:pieces => pieces)
		end

		it "should have 21 pieces" do
			@board.pieces.size.should == 21
		end

		it "should have 4 pieces in play" do
			@board.pieces_in_play.size.should == 4
		end

		it "should have 17 pieces captured" do
			@board.pieces_captured.size.should == 17
		end

		it "white should have 3 pieces in play" do
			@board.white_pieces_in_play.size.should == 3
		end

		it "black should have 1 piece in play" do
			@board.black_pieces_in_play.size.should == 1
		end

		it "white should have 5 pieces captured" do
			@board.white_pieces_captured.size.should == 5
		end

		it "black should have 12 piece captured" do
			@board.black_pieces_captured.size.should == 12
		end

	end

end

