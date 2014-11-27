#paddle-game.rb
require "rubygems"
require "gosu"

class GameWindow < Gosu::Window

	def initialize
		super(800, 600, false)
		self.caption = "Roman's Paddlegame"
		
		@x = @y = 100
		@vx = @vy = 5
		@ball_image = Gosu::Image.new(self, "ping.png", false)
	end
	
	def draw
		@ball_image.draw(@x, @y, 1)
	end
	
	def update
		@x += @vx
		@y += @vy
		@vx = -@vx if @x > 780 || @x < 0
		@vy = -@vy if @y> 580 || @y < 0
	end
end

window = GameWindow.new
window.show