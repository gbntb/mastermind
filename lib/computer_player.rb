# frozen_string_literal: true

# This is the Computer. You can try to guess its combination, or it can be the one
# trying to guess yours.
class ComputerPlayer < Player
  def generate_combination(colors)
    combination = Array.new(4)

    4.times { |i| combination[i] = (colors - combination).sample }

    combination
  end
end
