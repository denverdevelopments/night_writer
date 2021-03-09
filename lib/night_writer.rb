require './lib/line_reader'
require './lib/line'
require './lib/converter'


# print "Please enter the input file to convert to Braille:  "
#
# read_from = gets.chomp
# # read_from = "lib/#{gets.chomp}.txt"
#
# print "Please enter the output file after the Braille conversion:  "
#
# write_to = gets.chomp
# write_to = "#{gets.chomp}.txt"


all_lines = LineReader.new(ARGV[0]).complete
# all_lines = LineReader.new(read_from).complete

converter = Converter.new(all_lines)
converter.to_braille


# write_to = "braille.txt"

File.open(ARGV[1], "w") do |out|
  out.write(all_lines[0].text)    ##.join(" ")
end

file = File.open(ARGV[1])
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
