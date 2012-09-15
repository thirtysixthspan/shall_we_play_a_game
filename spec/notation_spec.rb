require './spec/spec_helper'

describe ChessNotation do

	context "pieces" do

		it "should detect pieces" do
			ChessNotation::Descriptive.get_piece(:white,'P').should == :pawn
			ChessNotation::Descriptive.get_piece(:white,'K').should == :king
		end

		it "should detect pieces with () embeded positions" do
			ChessNotation::Descriptive.get_piece(:white,'P(KR8)').should == [:pawn, [7,7]]
			ChessNotation::Descriptive.get_piece(:white,'K(K2)').should == [:king, [1,4]]
			ChessNotation::Descriptive.get_piece(:black,'K(K2)').should == [:king, [6,4]]
			ChessNotation::Descriptive.get_piece(:white,'P=KR8').should == [:pawn, [7,7]]
			ChessNotation::Descriptive.get_piece(:white,'K=K2').should == [:king, [1,4]]
		end

		it "should raise exception on bad pieces" do
			lambda {ChessNotation::Descriptive.get_piece(:white,'X')}.should raise_exception
		end

    end

	context "positions" do

		it "should detect rank and file index of position for white and black" do
			ChessNotation::Descriptive.get_position(:white,'KR1').should == [0,7]
			ChessNotation::Descriptive.get_position(:black,'K5').should == [3,4]
			ChessNotation::Descriptive.get_position(:white,'QB3').should == [2,2]
			ChessNotation::Descriptive.get_position(:black,'QR7').should == [1,0]
		end

		it "should raise exception on bad positions" do
			lambda {ChessNotation::Descriptive.get_position(:white,'DF23')}.should raise_exception
			lambda {ChessNotation::Descriptive.get_position(:white,'23')}.should raise_exception
			lambda {ChessNotation::Descriptive.get_position(:white,'FXd')}.should raise_exception
		end

    end

	context "moves" do

		it "should detect castling" do
			ChessNotation::Descriptive.get_move(:white,'O-O')[0].should == :kingside_castling
			ChessNotation::Descriptive.get_move(:white,'O-O-O')[0].should == :queenside_castling
		end

		it "should detect promotion" do
			ChessNotation::Descriptive.get_move(:white,'P-KR8=Q')[0].should == :promotion
			ChessNotation::Descriptive.get_move(:white,'P-K8(Q)')[0].should == :promotion
		end

		it "should detect captures" do
			ChessNotation::Descriptive.get_move(:white,'PxQ')[0].should == :capture
			ChessNotation::Descriptive.get_move(:black,'BxN')[0].should == :capture
		end

		it "should detect changes in position" do
			ChessNotation::Descriptive.get_move(:white,'P-QR4')[0].should == :advance
			ChessNotation::Descriptive.get_move(:black,'B-K3')[0].should == :advance
		end

		it "should raise exception on bad moves" do
			lambda {ChessNotation::Descriptive.get_move(:white,'P-DF23')}.should raise_exception
			lambda {ChessNotation::Descriptive.get_move(:white,'P-KR23')}.should raise_exception
			lambda {ChessNotation::Descriptive.get_move(:white,'G-KR2')}.should raise_exception
			lambda {ChessNotation::Descriptive.get_move(:white,'PxKR2')}.should raise_exception
		end

    end


end

