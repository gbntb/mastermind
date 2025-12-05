# frozen_string_literal: true

# This class holds all the functionality shared by both HumanPlayer and ComputerPlayer
class Player
  def feedback(combination, guess)
    feedback_array = []

    guess.each_with_index do |guess_color, guess_color_index|
      # rubocop: disable Style/ConditionalAssignment
      if combination[guess_color_index] == guess_color
        feedback_array[guess_color_index] = 2
      else
        feedback_array[guess_color_index] = combination.include?(guess_color) ? 1 : 0
      end
      # rubocop: enable Style/ConditionalAssignment
    end
    feedback_array
  end
end
