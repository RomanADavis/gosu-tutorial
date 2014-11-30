# breakout.rb
require "gosu"

class Ball
	def initialize(window)
		@x, @y = rand(780), rand(580)
		@vx, @vy = rand(-7..7), rand(-7..7)
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
		@balls = Array.new(200) {Ball.new(self)}
	end
	
	def update
		@balls.each {|ball| ball.move}
	end
	
	def draw
		@balls.each {|ball| ball.draw}
	end
end

window = GameWindow.new
window.show