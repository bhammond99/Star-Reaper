class Asteroid
	attr_reader :x, :y, :alive

	def initialize(window)
		@window = window
		@icon = Gosu::Image.new(@window, 'astroids1.png', true)
		@y = -rand(1000)
		@x = rand(@window.width)
		@alive = true
	end
	
	def update(laser)
		@y = @y + 10
		if @y > @window.height
			@y = 0
			@x = rand(@window.width)
		end
		hit_by?(laser)
	end

	def draw 
		@icon.draw(@x, @y, 5)
	end

	def hit_by?(laser)
		if Gosu::distance(laser.x, laser.y, @x, @y) < 30
			@alive = false
		end
	end		
end

