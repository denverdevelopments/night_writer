class Converter
  attr_reader :all_lines, :top, :middle, :bottom
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
    @top = []
    @middle = []
    @bottom = []
    @converted = []
  end

  def to_braille
    @all_lines.each do |line|
      # require "pry"; binding.pry
      if line.text.length <= 40
        scan_line(line.text)
      else
        last = line.text[40..-1]
        line = line.text[0..39]
        scan_line(line)
        scan_line(last)
      end
    end
  end

  def scan_line(text_in)
      text_in.split("").each do |character|
        fill_array(character)
      end
      write_lines
      File.write(ARGV[0], " \n\n\n\n", mode: "a")
  end

  def fill_array(character)
    @top << @@pairs[character][0]
    @middle << @@pairs[character][1]
    @bottom << @@pairs[character][2]
  end

  def write_lines
    File.open(ARGV[0], "w") do |out|
      out.write("#{@top.join("")} \n")
      out.write("#{@middle.join("")} \n")
      out.write("#{@bottom.join("")} \n")
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
      @converted << @@pairs.key(braille)
    end
      File.open(ARGV[0], "w") do |out|
        out.write("#{@converted.join("")}\n")
      end
    # print "\n"
  end

  def get_count?
    @converted.join("").length || (@top.join("").length + @middle.join("") + @top.join("").length)
    # @converted.join("").length || @all_lines.sum {|line| line.text.length}
     # @all_lines.sum {|line| line.text.length} || @converted.join("").length
    # @all_lines.sum do |line|
    #   line.text.length
    # end
  end
# require "pry"; binding.pry
end
