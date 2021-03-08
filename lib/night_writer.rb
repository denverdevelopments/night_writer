require './lib/line_reader'
require './lib/line'


# file = File.open("users.txt")

file_data = file.read
# "user1\nuser2\nuser3\n"

file_data = file.readlines.map(&:chomp)
# ["user1", "user2", "user3"]

# file.close

#OR
file_data = File.read("user.txt").split
# ["user1", "user2", "user3"]

File.foreach("users.txt") { |line| puts line }
