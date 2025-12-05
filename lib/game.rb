# frozen_string_literal: true

require_relative 'player'
require_relative 'computer_player'
require_relative 'human_player'

COLORS = %w[white black red yellow blue green].freeze

# Game is where everything happens. Depending on game mode, we
# ask for appropriate input and loop until the game is over.
class Game
  def initialize
    self.computer = ComputerPlayer.new
    self.human = HumanPlayer.new
  end

  def human_guesser_loop
    combination = computer.generate_combination(COLORS)
    guess_correct = false
    puts "You are guessing the computer's secret combination."
    6.times do
      guess = human.input_combination(COLORS)
      puts "Feedback : #{computer.give_feedback(combination, guess)}"
      guess_correct = true if guess == combination
      break if guess == combination
    end
    human_game_over(guess_correct)
  end

  private

  attr_accessor :computer, :human

  def human_game_over(guess_correct)
    if guess_correct
      puts 'You found the secret combination! You win!'
    else
      puts "Game Over! You couldn't guess the secret combination! You lose!"
    end
  end
end
