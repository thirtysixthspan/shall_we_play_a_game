class Piece

	attr_accessor :role, :name, :position, :color, :moves

    def move_to?(new_position,occupation)

    	@moves.any?{ |move| 
    				    @position.along(move.direction) == new_position && 
    		            (move.occupation & occupation) > 0
    		          }
    end

	def initialize(params = {})
		@name = params[:name] if params.include? :name
		@position = params[:position] if params.include? :position
		@color = params[:color] || :white
		@role = params[:role] || :uno
		@moves = params[:moves] || []
	end

end


