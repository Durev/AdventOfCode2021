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
    vertical_position -= command[:value]
  when "down"
    vertical_position += command[:value]
  when "forward"
    horizontal_position += command[:value]
  end
end

puts horizontal_position * vertical_position
