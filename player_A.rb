class Player
	attr_reader :lives, :x, :y, :laser

	def initialize(window)
		@window = window
		@icon = Gosu::Image.new(@window, "ship_up.png", true)
		@x = 0
		@y = window.height - 205
		@explosion = Gosu::Image.new(@window, "explosion.png", true)
		@exploded = false
		@lives = 4
		@laser = Laser.new(self, @window)
	end

	def update
		if @window.button_down? Gosu::Button::KbLeft
			move_left
		end
		if @window.button_down? Gosu::Button::KbRight
			move_right
		end
		if @window.button_down? Gosu::Button::KbSpace
			@laser.shoot
		end
		@laser.update
	end				

	def move_right
		@x = @x + 10
		if @x > @window.width-150
			@x = @window.width-150
		end
	end	

	def move_left
		@x = @x - 10
		if @x < 0
			@x = 0
		end
	end	
	
	def draw
		if @exploded
			@explosion.draw(@x, @y, 4)
		else
			@icon.draw(@x, @y, 2)
			@laser.draw
		end
	end	

	def hit_by?(asteroids)
		@exploded = asteroids.any? {|asteroid| Gosu::distance(asteroid.x, asteroid.y, @x, @y ) < 20}

		if @exploded 
			@lives = @lives - 1
		end
		@exploded	
	end

	def reset_position 
		@x = rand(@window.width)
	end	
end			


