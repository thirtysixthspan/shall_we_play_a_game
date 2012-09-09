require './spec/spec_helper'

describe Player do

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

