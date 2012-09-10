require './lib/game.rb'
require './lib/chess_board.rb'

require 'yaml'

class Chess < Game

	attr_accessor :white, :black

	def starting_pieces(params={})
 		color = params[:color] || :white
 		pieces = []
 		moves = YAML.load(File.open("./config/chess_moves.yaml", "r"))
 		YAML.load(File.open("./config/starting_pieces.yaml", "r")).each do |p|
 			p.merge!(:color => color)
 			p.merge!(:moves => moves[p[:role]])
   			pieces << Piece.new(p) 	
   		end	
   		pieces
	end

	def initialize()
		@white = Player.new(:name => 'Jane Doe', :color => :white)
		@black = Player.new(:name => 'John Doe', :color => :black)
		players = [@white, @black]

		@whos_move = @white

		white.pieces = starting_pieces(:color => :white)
		black.pieces = starting_pieces(:color => :black)

		board = ChessBoard.new(:pieces => white.pieces + black.pieces)

		rules = []
  		super(:name => 'Chess', 
  			  :players => players, 
  			  :rules => rules, 
  			  :board => board)
	end

	def next_player()
		if @whos_move == @white
			@whos_move = @black
		else
			@whos_move = @white
		end
	end

    def move(description)

    	next_player
    	true
    end

end


