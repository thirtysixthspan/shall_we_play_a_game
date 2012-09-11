require './lib/board.rb'

class ChessBoard < Board

 	def pieces_in_play
 		@pieces.select{|p| p.position }
 	end

 	def pieces_captured
 		@pieces.select{|p| !p.position}
 	end

 	def white_pieces_in_play
 		pieces_in_play.select{|p| p.color == :white}
 	end

 	def black_pieces_in_play
 		pieces_in_play.select{|p| p.color == :black}
 	end

 	def white_pieces_captured
 		pieces_captured.select{|p| p.color == :white}
 	end

 	def black_pieces_captured
 		pieces_captured.select{|p| p.color == :black}
 	end

 	def initialize(params={})		
 		super( params.merge(:shape => :square, :dimensions => [8]) )
 	end

end


