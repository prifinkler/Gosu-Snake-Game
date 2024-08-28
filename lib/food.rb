class Food
  attr_accessor :x, :y

  def initialize
    regenerate
  end

  def draw
    Gosu.draw_rect(
      @x * Snake::SIZE,
      @y * Snake::SIZE,
      Snake::SIZE - 1,
      Snake::SIZE - 1,
      Gosu::Color::GREEN
    )
  end

  def regenerate
    @x = rand(SnakeGame::WIDTH / Snake::SIZE)
    @y = rand(SnakeGame::HEIGHT / Snake::SIZE)
  end

end
