class LineReader
  attr_reader :read_from, :complete

  def initialize(read_from)
    @complete = []
    file = File.open(read_from)
    lines = file.readlines.map(&:chomp)
    lines.size.times {|n| complete << Line.new(lines[n])}
  end

end


# class Generator
#   attr_reader :cards_file, :cards
#
#   def initialize(cards_file)
#     @cards_file = cards_file
#     @cards = []
#     content = File.readlines (@cards_file)
#     cards_array = content.map {|line| line.split(',')}
#     cards_array.size.times {|n| cards << Card.new(cards_array[n][0], cards_array[n][1], cards_array[n][2].to_i)}
#   end
#
# end
