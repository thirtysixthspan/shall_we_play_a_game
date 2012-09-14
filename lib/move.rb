class Move

	attr_accessor :direction, :occupation

	def initialize(params = {})
		@direction = params[:direction]
		@occupation = params[:occupation] || 3

		raise "bad direction" if !@direction || @direction == [0,0]
	end

end


