require 'gosu'
require_relative 'snake'
require_relative 'food'

class SnakeGame < Gosu::Window
  WIDTH, HEIGHT = 640, 480

  def initialize
    super(WIDTH, HEIGHT, false, 1000/15)
    self.caption = "Snake Game 🐍"
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @large_font = Gosu::Font.new(self, Gosu::default_font_name, 40)

    @start_sound = Gosu::Sample.new("media/start.wav")
    @game_over_sound = Gosu::Sample.new("media/game_over.wav")

    @state = "start_screen"
    reset_game
  end

  def start_game
    @state = "playing"
    @snake.vel_x = 1
    @snake.vel_y = 0
  end

  def update
    case @state
    when "playing"
      @snake.update
      @snake.move

      if @snake.x == @food.x && @snake.y == @food.y
        @snake.increase
        @score += 10
        @food.regenerate
      end
      check_collision
    end
  end

  def draw
    case @state
    when "start_screen"
      draw_start_screen
    when "playing"
      draw_game
    when "game_over"
      draw_game
      draw_game_over_screen
    end
  end

  def button_down(id)
    close if id == Gosu:: KB_Q

    case @state
    when "start_screen"
      start_game if id == Gosu::KB_S
    when "game_over"
      reset_game if id == Gosu::KB_R
    end
  end

  private

  def reset_game
    @snake = Snake.new
    @food = Food.new
    @score = 0
    @state = "start_screen"
    @start_sound.play
  end

  def check_collision
    @snake.segments[0..-2].each do |x, y|
      if x == @snake.x && y == @snake.y
        @game_over_sound.play
        @state = "game_over"
      end
    end
  end

  def draw_start_screen
    @large_font.draw_text("Snake Game 🐍", WIDTH/2 - 100, HEIGHT/3, 1, 1.0, 1.0, Gosu::Color::GREEN)
    @font.draw_text("Press S to start", WIDTH/2 - 60, HEIGHT/2, 1, 1.0, 1.0, Gosu::Color::WHITE)
    @font.draw_text("Press Q to quit", WIDTH/2 - 60, HEIGHT/2 + 30, 1, 1.0, 1.0, Gosu::Color::WHITE)
  end

  def draw_game
    @snake.draw
    @food.draw
    @font.draw_text("Score: #{@score}", 10, 10, 1, 1.0, 1.0, Gosu::Color::YELLOW)
  end

  def draw_game_over_screen
    @large_font.draw_text("Game Over", WIDTH/2 - 100, HEIGHT/3, 1, 1.0, 1.0, Gosu::Color::RED)
    @font.draw_text("Final Score: #{@score}", WIDTH/2 - 60, HEIGHT/2, 1, 1.0, 1.0, Gosu::Color::WHITE)
    @font.draw_text("Press R to restart", WIDTH/2 - 70, HEIGHT/2 + 30, 1, 1.0, 1.0, Gosu::Color::WHITE)
    @font.draw_text("Press Q to quit", WIDTH/2 - 60, HEIGHT/2 + 60, 1, 1.0, 1.0, Gosu::Color::WHITE)
  end
end

SnakeGame.new.show
