require './lib/piece.rb'

class Player

  attr_accessor :name, :color, :pieces


	def initialize(params = {})
		@name = params[:name] || 'Jane Doe'
		@color = params[:color] || :white
		@pieces = params[:pieces] || []
	end

end


