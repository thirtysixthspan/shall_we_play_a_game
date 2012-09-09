require './lib/board.rb'
require './lib/rule.rb'
require './lib/player.rb'

class Game

	attr_accessor :name, :players, :rules, :board

	def initialize(params = {})
		@name = params[:name] || 'Game'
		@players = params[:players] || [Player.new()]
		@rules = params[:rules] || []
  		@board = params[:board] || Board.new(10,10)
  	end	

end


