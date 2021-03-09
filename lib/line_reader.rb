class LineReader
  attr_reader :read_from, :complete

  def initialize(read_from)
    @complete = []
    file = File.open(read_from)
    lines = file.readlines.map(&:chomp)
    lines.size.times {|n| complete << Line.new(lines[n])}
  end
end
