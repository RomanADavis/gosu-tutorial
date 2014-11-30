# breakout.rb
require "gosu"

class Ball
	attr_reader :x, :y, :width, :height
	def initialize(window)
		@x, @y = 200, 400
		@vx, @vy = -5, 5
		@width =  @height = 20
		
		@image  = Gosu::Image.new(window, "ping.png", false)
	end
	
	def reverse_y
		@vy = -@vy
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

class Paddle
	attr_reader :x, :y, :height, :width
	def initialize(window)
		@x = 200
		@y = 550
		@width = 80
		@height = 15
		
		@image = Gosu::Image.new(window, "paddle.png", false)
	end
	
	def move_left
		@x -= 5 if @x > 0
	end
	
	def move_right
		@x += 5 if @x < 720
	end
	
	def move(window)
		move_left if window.button_down? (Gosu::KbLeft)
		move_right if window.button_down?(Gosu::KbRight)
	end
	
	def draw
		@image.draw(@x, @y, 1)
	end
end

class Brick
	attr_reader :x, :y, :height, :width
	def initialize(window, x, y)
		@x, @y = x, y
		@width = 60
		@height = 20
		
		@image = Gosu::Image.new(window, "brick.png", false)
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
		@paddle = Paddle.new(self)
		@bricks = []
		(1..5).each do |row|
			(1..10).each {|column| @bricks << Brick.new(self, column * 70, row * 30)}
		end
	end
	
	def touching?(obj1, obj2)
		if obj1.x >  obj2.x - obj1.width and obj1.x < obj2.x + obj2.width and obj1.y > obj2.y - obj1.height and obj1.y < obj2.y + obj2.height
			return true
		end
		false
	end
	
	def update
		@paddle.move(self)
		@ball.move
		@ball.reverse_y if touching?(@ball, @paddle)
		@bricks.each do |brick|
			if touching?(@ball, brick)
				@ball.reverse_y
				@bricks.delete brick
			end
		end
	end
	
	def draw
		@ball.draw
		@paddle.draw
		@bricks.each {|brick| brick.draw}
	end
end

window = GameWindow.new
window.show