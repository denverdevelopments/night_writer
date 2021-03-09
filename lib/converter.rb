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
      scan_line(line.text)
    end
  end

  def scan_line(text_in)
      text_in.split("").each do |character|
        fill_array(character)
      end
      write_lines
  end

  def fill_array(character)
    @top << @@pairs[character][0]
    @middle << @@pairs[character][1]
    @bottom << @@pairs[character][2]
  end

  def write_lines
    if @top.join("").length <= 40
      write_braille(-1)
    elsif @top.join("").length <= 80
      write_braille(39)
      append_braille(40,-1)
    elsif @top.join("").length <= 120
      write_braille(39)
      append_braille(40,79)
      append_braille(80,-1)
    end
  end

  def write_braille(stop)
    File.open(ARGV[0], "w") do |out|
      out << "#{@top.join("")[0..stop]}\n"
      out << "#{@middle.join("")[0..stop]}\n"
      out << "#{@bottom.join("")[0..stop]}\n"
    end
  end

  def append_braille(start, stop)
    File.open(ARGV[0], "a") do |out|
      out << "#{@top.join("")[start..stop]}\n"
      out << "#{@middle.join("")[start..stop]}\n"
      out << "#{@bottom.join("")[start..stop]}\n"
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
    width = @converted.join("").length
    if @converted.join("").length <= 40
      write_english(-1)
    elsif @converted.join("").length <= 80
      write_english(39)
      append_english(40, -1)
    elsif @converted.join("").length <= 120
      write_english(39)
      append_english(40, 79)
      append_english(80, -1)
    elsif @converted.join("").length <= 160
      write_english(39)
      append_english(40, 79)
      append_english(80, 119)
      append_english(120, -1)
    end
  end

  def write_english(stop)
    File.open(ARGV[0], "w") do |out|
      out << "#{@converted.join("")[0..stop]}\n"
    end
  end

  def append_english(start, stop)
    File.open(ARGV[0], "a") do |out|
      out << "#{@converted.join("")[start..stop]}\n"
    end
  end

  def get_count?
    @all_lines.sum do |line|
      line.text.length
    end
  end

  # def is_capitalized?     ## psuedo
  #   if character = character.upcase
  #     @row << ["..", "..", ".0"]
  #   else
  #     @top << ".."
  #     @middle << ".."
  #     @bottom << ".0"
  #   end
  # end

end
