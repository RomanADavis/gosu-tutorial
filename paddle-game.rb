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
		@paddle_image = Gosu::Image.new(self, "pong.png", false)
		@lp_x, @lp_y, @vlp = 20, 270, 0
	end
	
	def draw
		@ball_image.draw(@x, @y, 1)
		@paddle_image.draw(@lp_x, @lp_y, 1)
	end
	
	def update

	#moving the ball
		@x += @vx
		@y += @vy
		@vx = -@vx if @x > 780 || @x < 0
		@vy = -@vy if @y> 580 || @y < 0

	#moving the left paddle	
		@lp_y = @lp_y + @vlp
	end
	
	def button_down(id)
		@vlp -= 5 if id == Gosu::KbW
		@vlp += 5 if id == Gosu::KbZ
	end
	
	def button_up(id)
		@vlp += 5 if id == Gosu::KbW
		@vlp -= 5 if id == Gosu::KbZ
	end
end

window = GameWindow.new
window.show