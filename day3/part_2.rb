input_path = File.expand_path("./data/input.txt", __dir__)
report = File.read(input_path).split("\n")

class NumbersFilter

  BITS_VALUES = %w[1 0]

  def initialize(numbers, position)
    @numbers = numbers
    @position = position
  end

  def oxygen_criteria_selection
    numbers.select { |nb| nb[position] == most_common_bit }
  end

  def co2_criteria_selection
    numbers.select { |nb| nb[position] == least_common_bit }
  end

  private

  attr_reader :numbers, :position

  def bits_at_position
    @_bits_at_position ||= numbers.map(&:chars).transpose[position]
  end

  def most_common_bit
    BITS_VALUES.max_by { |bit| bits_at_position.count(bit) }
  end

  def least_common_bit
    BITS_VALUES.reverse.min_by { |bit| bits_at_position.count(bit) }
  end

end

def oxygen_generator_rating(numbers, index = 0)
  return numbers.first if numbers.one?

  numbers = NumbersFilter.new(numbers, index).oxygen_criteria_selection

  oxygen_generator_rating(numbers, index + 1)
end

def co2_generator_rating(numbers, index = 0)
  return numbers.first if numbers.one?

  numbers = NumbersFilter.new(numbers, index).co2_criteria_selection

  co2_generator_rating(numbers, index + 1)
end

oxygen = oxygen_generator_rating(report).to_i(2)
co2 = co2_generator_rating(report).to_i(2)
puts oxygen * co2
