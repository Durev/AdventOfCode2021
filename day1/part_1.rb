input_path = File.expand_path("./data/input.txt", __dir__)
depth_measurements = File.read(input_path).split.map(&:to_i)

puts depth_measurements.each_cons(2).count { |a, b| a < b }
