class Position

	attr_accessor :location

	def paths
		@paths.keys
	end

	def path?(vector)
		paths.include?(vector)
	end

	def connect(vector, position)
		@paths[vector] = position if position
	end

	def initialize(location)
		@location = location
		@paths = {}
	end

end


