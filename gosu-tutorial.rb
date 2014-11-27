#tutorial-game/gosu-tutorial.rb
require "rubygems"
require "gosu"

class GameWindow < Gosu::Window
	def initialize
		super 640, 480, false
		self.caption = "Gosu Tutorial Game"
		@bouncing_ball = Ball.new(self)
	end
	
	def update
		@bouncing_ball.move
	end
	
	def draw
		@bouncing_ball.draw
	end
end

class Ball

	def initialize(window)
		@image = Gosu::Image.new(window, "ball.png", false)
		@x = @y = 50
		@vx = @vy = 5
	end
	
	def draw
		@image.draw(@x, @y, 1)
	end
	
	def move
		@x += @vx
		@y += @vy
		@vx = -@vx if @x > 540 || @x < 0
		@vy = -@vy if @y > 380 || @y < 0
	end
	
end

window = GameWindow.new
window.show