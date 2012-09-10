require './spec/spec_helper'

describe Player do

	context "by default" do

		before :all do
			@player = Player.new()
		end

		it "should have a default name of 'Jane Doe'" do
			@player.name.should == 'Jane Doe'
		end

		it "should have a default piece color of :white" do
			@player.color.should == :white
		end

		it "should by default have an empty set of playing pieces" do
			@player.pieces.should be_a_kind_of Array
			@player.pieces.size.should == 0
		end

	end

	context "when configured" do

		before :each do
			pieces = []
			pieces << double(:kind_of? => Piece, :color => :black, :role => :knight, :position => 'QN1')
			pieces << double(:kind_of? => Piece, :color => :black, :role => :knight, :position => 'KN1')
			@player = Player.new(:name => 'John Doe',
								 :color => :black,
								 :pieces => pieces)
		end

		it "should have a name of 'John Doe'" do
			@player.name.should == 'John Doe'
		end

		it "should have a color of :black" do
			@player.color.should == :black
		end

		it "should by have two knights" do
			@player.pieces.should be_a_kind_of Array
			@player.pieces.size.should == 2
			@player.pieces.select{ |p| p.role == :knight }.size.should == 2
		end

	end

end

