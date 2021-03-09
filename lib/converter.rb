class Converter
  attr_reader :all_lines
  @@pairs = {
              "a" => ["0.", "..", ".."], "b" => ["0.", "0.", ".."],
              "c" => ["00", "..", ".."], "d" => ["00", ".0", ".."],
              "e" => ["0.", ".0", ".."], "f" => ["00", "0.", ".."],
              "g" => ["00", "00", ".."], "h" => ["0.", "00", ".."],
              "i" => [".0", "0.", ".."], "j" => [".0", "00", ".."],
              "k" => ["0.", "..", "0."], "l" => ["0.", "0.", "0."],
              "m" => ["00", "..", "0."], "n" => ["00", ".0", "0."],
              "o" => ["0.", ".0", "0."], "p" => ["00", "0.", "0."],
              "q" => ["00", "00", "0."], "r" => ["0.", "00", "0."],
              "s" => [".0", "0.", "0."], "t" => [".0", "00", "0."],
              "u" => ["0.", "..", "00"], "v" => ["0.", "0.", "00"],
              "w" => [".0", "00", ".0"], "x" => ["00", "..", "00"],
              "y" => ["00", ".0", "00"], "z" => ["0.", ".0", "00"],
              "!" => ["..", "00", "0."], "'" => ["..", "..", "0."],
              "," => ["..", "0.", ".."], "-" => ["..", "..", "00"],
              "." => ["..", "00", ".0"], "?" => ["..", "0.", "00"],
              " " => ["..", "..", ".."]
            }

  def initialize(all_lines)
    @all_lines = all_lines
    @rows = []
  end

  def to_braille
    @all_lines.each do |line|
      if line.text.length <= 40
        line.scan_line
      else
        last = line.text[40..-1]
        line = line.text[0..39]
        line.scan_line
        last.scan_line
      end
    end
  end

  def to_english
    cycles = @all_lines[0].text.length / 2
    cycles.times do |index|
      bit = []
      bit << @all_lines[0].text[(2*index)..(2*index+1)]
      bit << @all_lines[1].text[(2*index)..(2*index+1)]
      bit << @all_lines[2].text[(2*index)..(2*index+1)]
      @rows << bit
    end
    @rows.each do |braille|
      # print @@pairs.key(braille)
      File.open(ARGV[0], "w") do |out|
        out.write("{@@pairs.key(braille)}\n")
      end
    end
    # print "\n"
  end

  def get_count?
    @all_lines.sum do |line|
      line.text.length
    end
  end
# require "pry"; binding.pry
end
