class Line
  attr_reader :text, :top, :middle, :bottom, :all
  @@pairs = {
              "a" => ["O.", "..", ".."], "b" => ["O.", "O.", ".."],
              "c" => ["OO", "..", ".."], "d" => ["OO", ".O", ".."],
              "e" => ["O.", ".O", ".."], "f" => ["OO", "O.", ".."],
              "g" => ["OO", "OO", ".."], "h" => ["O.", "OO", ".."],
              "i" => [".O", "O.", ".."], "j" => [".O", "OO", ".."],
              "k" => ["O.", "..", "O."], "l" => ["O.", "O.", "O."],
              "m" => ["OO", "..", "O."], "n" => ["OO", ".O", "O."],
              "o" => ["O.", ".O", "O."], "p" => ["OO", "O.", "O."],
              "q" => ["OO", "OO", "O."], "r" => ["O.", "OO", "O."],
              "s" => [".O", "O.", "O."], "t" => [".O", "OO", "O."],
              "u" => ["O.", "..", "OO"], "v" => ["O.", "O.", "OO"],
              "w" => [".O", "OO", ".O"], "x" => ["OO", "..", "OO"],
              "y" => ["OO", ".0", "OO"], "z" => ["O.", ".O", "OO"],
              "!" => ["..", "O0", "O."], "'" => ["..", "..", "O."],
              "," => ["..", "O.", ".."], "-" => ["..", "..", "OO"],
              "." => ["..", "OO", ".O"], "?" => ["..", "O.", "OO"],
              " " => ["..", "..", ".."]
            }

  def initialize(text)
    @text = text
    @top = []
    @middle = []
    @bottom = []
    @all = []
  end

  def scan_line
    @text.split("").each do |character|
      fill_top(char)
      fill_middle(char)
      fill_bottom(char)
    end
    print_lines
  end

  def scan_row
    cycles = @text.length / 2
    @all << @text
    # @text.split("").each do |char|
    #
    # end
  end

  def fill_top(char)
  end

end
