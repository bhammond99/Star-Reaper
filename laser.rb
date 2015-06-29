class Laser
  attr_reader :x, :y

	def initialize(player, window)
		@player = player
		@window = window
		@shooting = false
		@x = @player.x + 71  
		@y = @player.y
		@icon = Gosu::Image.new(@window, "ship_rounds.png", true)
	end
	
	def shoot
		@shooting = true
	end
	
	def update
		if @shooting
			@y = @y - 25
			if @y < 0
				@shooting = false
			end
		else
			@x = @player.x + 71
			@y = @player.y
		end
	end

	def draw 
		if @shooting
			@icon.draw(@x, @y, 1)
		else
			@icon.draw(@player.x + 71, @player.y, 1)	
		end							
	end
end		
