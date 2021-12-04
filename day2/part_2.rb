input_path = File.expand_path("./data/input.txt", __dir__)

course_plan =
  File
    .read(input_path)
    .split("\n")
    .map do |command|
      direction, value = command.split

      { direction: direction, value: value.to_i }
    end

horizontal_position = 0
vertical_position = 0
aim = 0

course_plan.each do |command|
  case command[:direction]
  when "up"
    aim -= command[:value]
  when "down"
    aim += command[:value]
  when "forward"
    horizontal_position += command[:value]
    vertical_position += aim * command[:value]
  end
end

puts horizontal_position * vertical_position
