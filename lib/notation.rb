
module ChessNotation

	ROLES = {
			  'K' => :king,
			  'Q' => :queen,
			  'N' => :knight,
			  'B' => :bishop,
			  'R' => :rook,
			  'P' => :pawn
			}

	module Descriptive

		FILE_MAP = {'QR'=>0,'QN'=>1,'QB'=>2,'Q'=>3,'K'=>4,'KB'=>5,'KN'=>6,'KR'=>7}
		RANK_MAP = {'1'=>0,'2'=>1,'3'=>2,'4'=>3,'5'=>4,'6'=>5,'7'=>6,'8'=>7}

		def self.get_position(color,description)
			raise 'Error matching destination' unless description.match(/[A-Z]{1,2}[0-9]{0,1}/)

			file, rank = description.split(%r{(?<=[A-Z])(?=[1-9])})
			file_index = FILE_MAP[file] || raise('Unrecognized file in description')
			rank_index = RANK_MAP[rank] || raise('Unrecognized rank in description')
			rank_index = 7 - rank_index if color == :black
			return rank_index, file_index
	    end			

		def self.get_piece(color, description)

			if description.match(/^[A-Z]{1}$/)
				return ROLES[description] || raise('Unrecognized piece in description')
			end
			
			if description.match(/^([A-Z]{1})([\(\=]([^\)]*)\){0,1}){0,1}$/)
				role = ROLES[$1] || raise('Unrecognized piece in description')
				position = get_position(color,$3)
				return [role, position]
			end
					
			raise 'Error matching piece'
		end

	    def self.get_move(color,description)
	    	description.upcase!

	    	piece, destination = description.split(%r{[-X]})
	    	raise 'Error parsing move notation' unless piece && destination

	    	receiver = nil
	    	receiver_position = nil
	    	
		    case description
		    when 'O-O'
	    		move_type = :kingside_castling
	    		actor = :king
	    		rank = color == :white ? 0 : 7
	    		actor_position = [rank,5]
	    		receiver = :rook
	    		receiver_position = [rank,6]
		    when 'O-O-O'
	    		move_type = :queenside_castling
	    		actor = :king
	    		rank = color == :white ? 0 : 7
	    		actor_position = [rank,2]
	    		receiver = :rook
	    		receiver_position = [rank,3]
		    when /[\(\/\=]/
		    	move_type = :promotion
				description, promotion = description.gsub(')','').split(%r{[\(\/\=]})
				receiver = get_piece(color,promotion)
	    	when /-/
	    		move_type = :advance 
	    		actor = get_piece(color,piece)
	    		actor_position = get_position(color,destination)
	    	when /X/
	  			move_type = :capture 
	  		    actor = get_piece(color,piece)
				receiver = get_piece(color,destination)
	    	else
	    		raise 'Error parsing move notation'
	    	end

		    return [move_type, actor, actor_position, receiver, receiver_position]
	    end

	end

end