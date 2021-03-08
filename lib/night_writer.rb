require './lib/line_reader'
require './lib/line'


print "Please enter the input file to convert to Braille:  "
read_from = "lib/#{gets.chomp}.txt"

print "Please enter the output file after the Braille conversion:  "
write_to = "#{gets.chomp}.txt"


# read_from = 'lib/messages.txt'
# read_from = 'lib/sample_two.txt'

all_lines = LineReader.new(read_from).complete

File.open(write_to, "w") do |out|
  out.write(all_lines[0].text)
end

file = File.open(write_to)
p file.read

# File.open("output.txt", "w") {|out| out.write(all_lines[0].text)}
#
# file = File.open("output.txt")
# p file.read
# file.close




# file_data = file.readlines.map(&:chomp)
# # ["user1", "user2", "user3"]
# #OR
# file_data = File.read("user.txt").split
# # ["user1", "user2", "user3"]
#
# File.foreach("users.txt") { |line| puts line }
