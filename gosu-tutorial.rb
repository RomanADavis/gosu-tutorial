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
	
	end
	
	def draw
		@bouncing_ball.draw
	end
end

class Ball

	def initialize(window)
		@image = Gosu::Image.new(window, "ball.png", false)
		@x = @y = 50
	end
	
	def draw
		@image.draw(@x, @y, 1)
	end
	
	def move

	end
	
end

window = GameWindow.new
window.show