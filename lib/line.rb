class Line
  attr_reader :text, :top, :middle, :bottom
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

  def initialize(text="")
    @text = text
    @top = []
    @middle = []
    @bottom = []
  end

  def scan_line
    if @text.length <= 40
      @text.split("").each do |character|
        require "pry"; binding.pry
        fill_top(character)
        fill_middle(character)
        fill_bottom(character)
      end
      write_lines
      File.write(ARGV[0], " \n\n\n\n", mode: "a")
    else
      cut = @text[0..39]
      cut.split("").each do |character|
        require "pry"; binding.pry
        fill_top(character)
        fill_middle(character)
        fill_bottom(character)
      end
      write_lines
      File.write(ARGV[0], " \n\n\n\n", mode: "a")
    end
  end

  def fill_top(character)
    @top << @@pairs[character][0]
  end

  def fill_middle(character)
    @middle << @@pairs[character][1]
  end

  def fill_bottom(character)
    @bottom << @@pairs[character][2]
  end

  def write_lines
    File.open(ARGV[0], "w") do |out|
      out.write("#{@top.join("")}\n")
      out.write("#{@middle.join("")}\n")
      out.write("#{@bottom.join("")}\n")
    end
  end

end
