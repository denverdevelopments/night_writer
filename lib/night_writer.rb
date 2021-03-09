require './lib/line_reader'
require './lib/line'
require './lib/converter'

## OPTION For User Inputs, instead of ARGV ##
# print "Please enter the input file to convert to Braille:  "
# read_from = "lib/#{gets.chomp}.txt"
#
# all_lines = LineReader.new(read_from).complete
#
# print "Please enter the output file after the Braille conversion:  "
# write_to = "#{gets.chomp}.txt"


all_lines = LineReader.new(ARGV[0]).complete

converter = Converter.new(all_lines)
converter.to_braille

puts "Created '#{ARGV[1]}' containing #{converter.get_count?} characters"
