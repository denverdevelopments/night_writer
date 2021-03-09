require './lib/line_reader'
require './lib/line'
require './lib/converter'


# print "Please enter the input file to convert to Braille:  "
# read_from = "lib/#{gets.chomp}.txt"
#
# print "Please enter the output file after the Braille conversion:  "
# write_to = "#{gets.chomp}.txt"


read_from = 'lib/paragraph_multi.txt'
# read_from = 'lib/messages.txt'
# read_from = 'lib/sample_two.txt'

# all_lines = LineReader.new(ARGV[0]).complete
all_lines = LineReader.new(read_from).complete

converter = Converter.new(all_lines)
converter.to_braille


# write_to = "braille.txt"

# File.open(ARGV[1], "w") do |out|
# File.open(write_to, "w") do |out|
#   all_lines.each do |line|
#     out.write("#{line.text}\n")
#   end
#   # out.write(all_lines.map {|line| line.text})
#   # out.write(all_lines[0].text)    ##.join(" ")
# end

puts "Created 'braille.txt' containing #{converter.get_count?} characters"

# file = File.open(ARGV[1])
# file = File.open(write_to)
# p file.read     ## TEST p

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
