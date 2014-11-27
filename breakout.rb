# breakout.rb
require "gosu"

class Ball
	def initialize(window)
		@x, @y = 200, 400
		@vx, @vy = -5, 5
		@image  = Gosu::Image.new(window, "ping.png", false)
	end
	
	def move
		@x += @vx
		@y += @vy
		@vx = -@vx if @x < 0 || @x > 780
		@vy = -@vy if @y < 0 || @y > 580 
	end

	
	def draw
		@image.draw(@x, @y, 1)
	end
end
class GameWindow < Gosu::Window
	def initialize
		super 800, 600, false
		self.caption = "Breakout"
		@ball = Ball.new(self)
	end
	
	def update
		@ball.move
	end
	
	def draw
		@ball.draw
	end
end

window = GameWindow.new
window.show