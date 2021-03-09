class Converter
  attr_reader :all_lines

  def initialize(all_lines)
    @all_lines = all_lines
    @rows = []
  end

  def to_braille
    @all_lines.each do |line|
      p line
      # line.scan_line
    end
  end

end
