class Board

	attr_accessor :shape, :dimensions

	def initialize(params = {})
		@shape = params[:shape] || :square
		@dimensions = params[:dimensions] || [5]
 	end

 	def size
 		@dimensions[0] ** 2 if @shape == :square
 	end

end


