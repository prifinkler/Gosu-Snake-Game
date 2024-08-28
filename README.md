# Snake Game 🐍

A classic Snake game implemented in Ruby using the Gosu library.

## Description
This project is a simple implementation of the classic Snake game. The player controls a snake, guiding it to eat food and grow longer while avoiding collisions with its own body.

## Features

- Smooth snake movement
- Randomly generated food
- Score tracking
- Start and game over screens
- Sound effects

## Requirements

- Ruby
- Gosu gem

## Installation

- Clone this repository
- Install the required gem:
  
  ```ruby
  gem install gosu
  ```
## How to Play
- Run the game with:

  ```ruby
  ruby game.rb
  ```

- Press 'S' to start the game
- Use arrow keys to control the snake
- Eat food to grow and increase your score
- Avoid hitting the the snake's own body
- Press 'R' to restart after game over
- Press 'Q' at any time to quit

## File Structure

- game.rb: Main game loop and window management
- snake.rb: Snake class with movement and growth logic
- food.rb: Food class for generating and drawing food

## Further Improvements

- Game over when colliding with walls (currently, the snake warps to the opposite side)
- Increasing game speed as the snake grows longer
