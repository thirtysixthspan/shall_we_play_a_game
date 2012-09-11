class Piece

	attr_accessor :role, :name, :position, :color, :moves

    def move_to?(new_position)
    	@moves.select{ |move| @position.along(move[0..1]) == new_position}.size > 0
    end

	def initialize(params = {})
		@name = params[:name] if params.include? :name
		@position = params[:position] if params.include? :position
		@color = params[:color] || :white
		@role = params[:role] || :uno
		@moves = params[:moves] || []
	end

end


