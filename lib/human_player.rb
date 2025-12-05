# frozen_string_literal: true

# Human player, can try to guess the computer's secret combination,
# or create a combination of his own to have the computer guess.
class HumanPlayer < Player
  def input_combination(colors)
    print 'Your colors: '
    combination_valid = false

    until combination_valid
      combination = gets.chomp.split(', ')
      combination_valid = combination_colors_valid?(combination, colors) && combination_colors_uniq?(combination)
    end
    combination
  end

  private

  def combination_colors_uniq?(combination)
    combination.uniq.length == 4
  end

  def combination_colors_valid?(combination, colors)
    combination.all? { |color| colors.include?(color) }
  end
end
