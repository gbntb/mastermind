# frozen_string_literal: true

# This class holds all the functionality shared by both HumanPlayer and ComputerPlayer
class Player
  def give_feedback(combination, guess)
    feedback_array = []

    guess.each_with_index do |guess_color, guess_color_index|
      feedback_array[guess_color_index] = generate_color_feedback(combination, guess_color, guess_color_index)
    end
    feedback_array
  end

  private

  def generate_color_feedback(combination, guess_color, guess_color_index)
    return 2 if combination[guess_color_index] == guess_color

    combination.include?(guess_color) ? 1 : 0
  end
end
