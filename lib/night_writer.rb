require './lib/line_reader'
require './lib/line'


# print "Please enter the input file to convert to Braille:  "
# read_from = gets.chomp

# all_lines = LineReader.new(read_from).complete
# all_lines = LineGenerator.new('lib/messages.txt').complete

all_lines = LineReader.new('lib/sample_file.txt').complete



# # file = File.open("users.txt")
# file_data = file.readlines.map(&:chomp)
# # ["user1", "user2", "user3"]
# # file.close
#
# #OR
# file_data = File.read("user.txt").split
# # ["user1", "user2", "user3"]
#
# File.foreach("users.txt") { |line| puts line }
