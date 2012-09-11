require './spec/spec_helper'

describe Position do

	context 'initialization' do

		before :each do
			@position = Position.new([0,0])
		end

		it "should have a n dimensional location" do
			@position.location.should be_a_kind_of Array
			@position.location.should == [0,0] 
		end

		it "should have no paths" do
			@position.paths.should == []
		end

	end

	context 'paths' do

		before :each do
			@position1 = Position.new([0,0])
			@position2 = Position.new([1,0])
		end

		it "should allow the addition of paths" do
			@position1.connect([1,0],@position2)
			@position1.paths.should include [1,0]
		end

		it "should give you a list of available paths" do
			@position1.connect([1,0],@position2)
			@position1.paths.should include [1,0]
		end

		it "should tell you if a path is available" do
			@position1.connect([1,0],@position2)
			@position1.path?([1,0]).should == true
		end		

		it "should give you a position along a path" do
			@position1.connect([1,0],@position2)
			@position1.position_along([1,0]).should == @position2
		end		

		it "should tell you if a path is not available" do
			@position1.connect([1,0],@position2)
			@position1.path?([0,1]).should == false
		end		

	end

end

