require './lib/position.rb'

class Board

	attr_accessor :shape, :dimensions, :pieces, :positions

    def position(vector)
    	@positions[vector]
    end

 	def setup_board_positions
 		@positions = {}
 		rows = @dimensions[0]
 		columns = @dimensions[1] || @dimensions[0]
 		rows.times do |row|
   			columns.times do |column|
  				@positions[[row,column]] = Position.new([row,column])
        	end
        end

 		@positions.each do |location, position|
			[-1,0,1].each do |dr|
				[-1,0,1].each do |df|
					next if dr==0 && df==0
					position.connect([dr, df], position([location[0]+dr,location[1]-df]))
				end
			end
		end			
    end

	def initialize(params = {})
		@shape = params[:shape] || :square
		@dimensions = params[:dimensions] || [5]
		@pieces = params[:pieces] || []
		setup_board_positions if @shape == :square || @shape == :rectangle
 	end

 	def size
 		return @positions.size
 	end

end


