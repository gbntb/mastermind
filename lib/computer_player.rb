# frozen_string_literal: true

# This is the Computer. You can try to guess its combination, or it can be the one
# trying to guess yours.
class ComputerPlayer < Player
  def generate_combination(colors)
    combination = Array.new(4)

    4.times { |i| combination[i] = (colors - combination).sample }

    combination
  end

  def generate_guess(previous_guess, feedback, colors)
    guess = Array.new(4)
    available_colors = colors.dup
    place_good_colors(previous_guess, feedback, guess, available_colors)
    available_indices = find_available_indices(feedback)
    randomize_remaining_colors(available_colors, available_indices, guess)
    guess
  end

  private

  def find_available_indices(feedback)
    indices = []
    feedback.each_with_index do |fb, index|
      next if fb == 2

      indices << index
    end
    indices
  end

  def place_good_colors(previous_guess, feedback, guess, available_colors)
    previous_guess.each_with_index do |pg_color, pg_index|
      guess[pg_index] = pg_color if feedback[pg_index] == 2
      available_colors.delete(pg_color) if feedback[pg_index] == 2 || feedback[pg_index].zero?
    end
  end

  def randomize_remaining_colors(available_colors, available_indices, guess)
    available_indices.each do |index|
      guess[index] = available_colors.sample
      available_colors.delete(guess[index])
    end
  end
end
