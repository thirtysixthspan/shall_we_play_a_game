require './lib/game.rb'
require 'yaml'

class Chess < Game

	def starting_pieces(params={})
 		color = params[:color] || :white
 		pieces = []
 		YAML.load(File.open("./config/starting_pieces.yaml", "r")).each do |p|
   			pieces << Piece.new( p.merge(:color => color) )	
   		end	
   		pieces
	end

	def initialize()
		board = Board.new(:shape => :square,
			              :dimensions => [8, 8])
		white = Player.new(:name => 'Jane Doe', :color => :white)
		black = Player.new(:name => 'John Doe', :color => :black)
		players = [white, black]

		white.pieces = starting_pieces(:color => :white)
		black.pieces = starting_pieces(:color => :black)

		rules = []
  		super(:name => 'Chess', 
  			  :players => players, 
  			  :rules => rules, 
  			  :board => board)
	end

end


