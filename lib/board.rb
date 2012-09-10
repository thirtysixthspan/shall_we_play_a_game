class Board

	attr_accessor :shape, :dimensions, :pieces

	def initialize(params = {})
		@shape = params[:shape] || :square
		@dimensions = params[:dimensions] || [5]
		@pieces = params[:pieces] || []
 	end

 	def size
 		return @dimensions[0] ** 2 if @shape == :square
 		return @dimensions.inject(:*) if @shape == :rectangle
 	end

end


