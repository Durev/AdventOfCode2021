input_path = File.expand_path("./data/input.txt", __dir__)
report = File.read(input_path).split("\n")

BITS_VALUES = [
  ONE = "1",
  ZERO = "0",
].freeze

most_common_bits = 
  report.map(&:chars).transpose.map do |bits|
    BITS_VALUES.max_by { |bit| bits.count(bit) }
  end

gamma = most_common_bits.join.to_i(2)
epsilon = most_common_bits.join.gsub(/./, ONE => ZERO, ZERO => ONE).to_i(2)

puts gamma * epsilon
