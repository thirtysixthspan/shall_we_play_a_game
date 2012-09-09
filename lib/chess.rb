require './lib/game.rb'

class Chess < Game

	def initialize()
		board = Board.new(:shape => :square,
			              :dimensions => [8, 8])
		players = []
		players << Player.new(:name => 'Jane Doe', :color => :white)
		players << Player.new(:name => 'John Doe', :color => :black)
		rules = []
  		super(:name => 'Chess', 
  			  :players => players, 
  			  :rules => rules, 
  			  :board => board)
	end

end


