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

  # rubocop: disable Metrics/MethodLength
  def computer_guesser_loop
    combination = human.input_combination(COLORS)
    guess_correct = false
    puts 'The computer is trying to guess your secret combination...'
    previous_guess = nil
    feedback = nil
    6.times do
      guess = computer.generate_guess(previous_guess, feedback, COLORS)
      guess_correct = true if guess == combination
      break if guess == combination

      feedback = human.give_feedback(combination, guess)
      previous_guess = guess
    end
    computer_game_over(guess_correct)
  end
  # rubocop: enable Metrics/MethodLength

  private

  attr_accessor :computer, :human

  def human_game_over(guess_correct)
    if guess_correct
      puts 'You found the secret combination! You win!'
    else
      puts "Game Over! You couldn't guess the secret combination! You lose!"
    end
  end

  def computer_game_over(guess_correct)
    if guess_correct
      puts 'The computer guessed your secret combination. You lose!'
    else
      puts "The computer couldn't guess your combination. You win!"
    end
  end
end
