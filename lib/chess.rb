require './lib/game.rb'
require './lib/chess_board.rb'

require 'yaml'

class Chess < Game

	attr_accessor :white, :black

	def set_of_pieces()
		map = {} 
 		YAML.load(File.open("./config/starting_pieces.yaml", "r")).each do |p|
 			map[p[:name]] = p[:role]
   		end	
   		map
	end

    def get_position(color,description)
    	file_map = {'QR'=>0,'QN'=>1,'QB'=>2,'Q'=>3,'K'=>4,'KB'=>5,'KN'=>6,'KR'=>7}
    	rank_map = {'1'=>0,'2'=>1,'3'=>2,'4'=>3,'5'=>4,'6'=>5,'7'=>6,'8'=>7}
		file_string, rank_string = description.split(%r{(?<=[A-Z])(?=[1-9])})
		file_index = file_map[file_string]
		rank_index = rank_map[rank_string]
		rank_index = 7 - rank_index if color == :black
		position = @board.position( [ rank_index, file_index ] )
		raise 'unrecognized position' unless position
		position
    end	

	def starting_pieces(params={})
 		color = params[:color] || :white
 		pieces = []
 		moves = YAML.load(File.open("./config/chess_moves.yaml", "r"))
        moves.each { |role,ml| ml.each {|m| m[0]*=-1 } } if color == :black
 		YAML.load(File.open("./config/starting_pieces.yaml", "r")).each do |p|
 			p.merge!(:color => color)
 			p.merge!(:moves => moves[p[:role]])
 			p[:position] = get_position(color,p[:position])
   			pieces << Piece.new(p)
   		end	
   		pieces
	end

	def blacks_move?()
		@whos_move == @black
	end

	def whites_move?()
		@whos_move == @white
	end

	def blacks_move()
		@whos_move = @black
	end

	def whites_move()
		@whos_move = @white
	end

	def switch_player()
		if whites_move?
			blacks_move()
		else
			whites_move()
		end
	end

	def initialize()
		@white = Player.new(:name => 'Jane Doe', :color => :white)
		@black = Player.new(:name => 'John Doe', :color => :black)
		@players = [@white, @black]

		@board = ChessBoard.new()

		@piece_roles = set_of_pieces

		@white.pieces = starting_pieces(:color => :white)
		@black.pieces = starting_pieces(:color => :black)
		@board.pieces = @white.pieces + @black.pieces

		whites_move()

		@rules = []

		@name = 'Chess'
	end

    def parse(description)

    	piece, destination = description.upcase.split(%r{[-X]})
		captured_piece = nil

    	piece_role = @piece_roles[piece]
    	raise 'unrecognized piece in description' unless piece_role

    	if description.match('-') &&
    	   destination.match(/[A-Z]{1,2}[0-9]{1}/)

	    	return [piece_role, get_position(@whos_move.color,destination)]

	    end

    	if description.match(/x/i)

    		capture_role = @piece_roles[destination]
    		raise 'unrecognized capture piece in description' unless capture_role

    		moving_piece = threatens(:role => piece_role, :postion => destination_position)

	    	destination_position = nil
	    	captured_piece = nil

	      	return [piece_role, destination_position, capture_role]	

	    end  	

    end

    def occupation(position)
    	state = 1	
    	pieces.each do |p|
        	if p.position == position
        		if p.color != @whos_move
        			state = 2
        		else
        			state = 4
        		end		
        	end		
    	end
    	state
    end

	def valid_move?(params)
    	role = params[:role]
    	position = params[:position]

    	candidates = @board.pieces_in_play
						   .select{|p| p.color == @whos_move.color}
						   .select{|p| p.role == role}
						   .select{|p| p.move_to?(position,occupation(position))} 

		candidates.size > 0
	end

	def execute_move(params)
    	role = params[:role]
    	position = params[:position]

    	candidates = @board.pieces_in_play
						   .select{|p| p.color == @whos_move.color}
						   .select{|p| p.role == role}
						   .select{|p| p.move_to?(position,occupation(position))} 
        
        p candidates.size
		raise "ambiguous move" if candidates.size > 1

		piece = candidates.first

		piece.position = position
	end

	def allowed_move?(description)
    	piece_role, destination_position, capture_role = parse(description)
    	valid_move?(:role => piece_role, :position => destination_position)
    end

    def move(description)
    	piece_role, destination_position, capture_role = parse(description)

    	return false unless valid_move?(:role => piece_role, :position => destination_position)    	

    	execute_move(:role => piece_role, :position => destination_position)

    	switch_player()

    	true
    end
end


