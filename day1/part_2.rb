input_path = File.expand_path("./data/input.txt", __dir__)
depth_measurements = File.read(input_path).split.map(&:to_i)

WINDOW_SIZE = 3

puts depth_measurements
   .each_cons(WINDOW_SIZE + 1)
   .count { |measures| measures.first(WINDOW_SIZE).sum < measures.last(WINDOW_SIZE).sum }
