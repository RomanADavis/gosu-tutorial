# Going along with a tutorial. I hate this code. Way too many magic numbers.. Verbose comments that 
# would be better handled by more, shorter methods with descriptive names. Not to mention the lack of
# class structure. Bleh!

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
		@rp_x, @rp_y, @vrp = 760, @lp_y, 0
	end
	
	def draw
		@ball_image.draw(@x, @y, 1)
		@paddle_image.draw(@lp_x, @lp_y, 1)
		@paddle_image.draw(@rp_x, @rp_y, 1)
	end
	
	def update

	#moving the ball
		@x += @vx
		@y += @vy
		@vx = -@vx if @x > 780 || @x < 0
		@vy = -@vy if @y> 580 || @y < 0

	#moving the left paddle	
		unless (@vlp < 0 && @lp_y <= 0) || (@vlp > 0 &&  @lp_y >= 540) # Don't move off the screen
			@lp_y = @lp_y + @vlp
		end
	#moving the right paddle	
		unless (@vrp < 0 && @rp_y <= 0) || (@vrp > 0 &&  @rp_y >= 540) # Don't move off the screen
			@rp_y = @rp_y + @vrp
		end
		
	# collision of left paddle and ball
		if @x > 30 && @x < 41 && @y > @lp_y - 10 && @y < @lp_y + 70
			@vx += 5
		end
	# collision of  right paddle and ball
		if @x > 770 && @x < 759 && @y > @rp_y - 10 && @y < @rp_y + 70
			@vx -= 5
		end
	end
	
	def button_down(id)
		@vlp -= 5 if id == Gosu::KbW
		@vlp += 5 if id == Gosu::KbZ
		@vrp -= 5 if id == Gosu::KbI
		@vrp += 5 if id == Gosu::KbN
	end
	
	def button_up(id)
		@vlp += 5 if id == Gosu::KbW
		@vlp -= 5 if id == Gosu::KbZ
		@vrp += 5 if id == Gosu::KbI
		@vrp -= 5 if id == Gosu::KbN
	end
end

window = GameWindow.new
window.show