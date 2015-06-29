class Window < Gosu::Window

    def initialize
        super(800,800,false)
        @player = Player.new(self)
        @asteroids = [Asteroid.new(self), Asteroid.new(self), Asteroid.new(self), 
        Asteroid.new(self), Asteroid.new(self), Asteroid.new(self), Asteroid.new(self), 
        Asteroid.new(self), Asteroid.new(self) ]
        @running = true
        @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
        @backround = Gosu::Image.new(self, "spaceback.jpg", true)
    end
    
    def update
        if @running
            if @player.hit_by? @asteroids
                @running = false
            else
                run_game
            end
        end
        
        if @running == false and button_down? Gosu::Button::KbR and @player.lives > 0
            @running = true
            @player.reset_position
        end
    end
    
    def run_game
        live_asteroids.each {|asteroid| asteroid.update(@player.laser)}
        @player.update
    end

    def live_asteroids
    	@asteroids.select {|asteroid| asteroid.alive == true }
    end	
    
    def draw
    	@backround.draw(0,0,1)
        @player.draw
        live_asteroids.each {|asteroid| asteroid.draw}
        @font.draw("Lives: #{@player.lives}", 10, 10, 3.0, 1.0, 1.0, 0xffffffff)
    end
    
end