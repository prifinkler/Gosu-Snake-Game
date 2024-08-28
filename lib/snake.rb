class Snake
  SIZE = 20
  MIN_TAIL = 3

  attr_accessor :x, :y, :vel_x, :vel_y
  attr_reader :segments

  def initialize
    @x = 10
    @y = 10
    @vel_x = 0
    @vel_y = 0
    @tail = MIN_TAIL
    @segments = []
    @beep = Gosu::Sample.new("media/eat.wav")
  end

  def update
    @x += @vel_x
    @y += @vel_y

    warp

    @segments << [@x, @y]
    @segments.shift until @segments.size <= @tail
  end

  def draw
    @segments.each do |x, y|
      Gosu.draw_rect(
        x * SIZE,
        y * SIZE,
        SIZE - 1,
        SIZE - 1,
        Gosu::Color::WHITE
      )
    end
  end

  def warp
    @x = 0 if @x >= (SnakeGame::WIDTH / SIZE)
    @x = (SnakeGame::WIDTH / SIZE) - 1 if @x < 0
    @y = 0 if @y >= (SnakeGame::HEIGHT / SIZE)
    @y = (SnakeGame::HEIGHT / SIZE) - 1 if @y < 0
  end

  def move
    up    if Gosu.button_down?(Gosu::KB_UP)     && @vel_y == 0
    down  if Gosu.button_down?(Gosu::KB_DOWN)   && @vel_y == 0
    left  if Gosu.button_down?(Gosu::KB_LEFT)   && @vel_x == 0
    right if Gosu.button_down?(Gosu::KB_RIGHT)  && @vel_x == 0
  end

  def up
    @vel_x = 0
    @vel_y = -1
  end

  def down
    @vel_x = 0
    @vel_y = 1
  end

  def left
    @vel_x = -1
    @vel_y = 0
  end

  def right
    @vel_x = 1
    @vel_y = 0
  end

  def increase
    @beep.play
    @tail += 1
  end

  def reset
    @tail = MIN_TAIL
  end
end
