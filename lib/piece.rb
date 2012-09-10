class Piece

	attr_accessor :role, :name, :position, :color, :moves

	def initialize(params = {})
		@name = params[:name] if params.include? :name
		@position = params[:position] if params.include? :position
		@color = params[:color] || :white
		@role = params[:role] || :uno
		@moves = params[:moves] || []
	end

end


