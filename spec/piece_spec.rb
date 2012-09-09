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

	end

	context "when configured" do

		before :all do
			@piece = Piece.new( :name => 'N',
								:role => :knight,
								:color => :black,
								:position => 'QN1')
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

	end



end

