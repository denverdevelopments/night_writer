class Line
  attr_reader :text

  def initialize(text="")
    @text = text
    # @top = []
    # @middle = []
    # @bottom = []
  end

  # def scan_line
  #   if @text.length <= 40
  #     @text.split("").each do |character|
  #       require "pry"; binding.pry
  #       fill_top(character)
  #       fill_middle(character)
  #       fill_bottom(character)
  #     end
  #     write_lines
  #     File.write(ARGV[0], " \n\n\n\n", mode: "a")
  #   else
  #     cut = @text[0..39]
  #     cut.split("").each do |character|
  #       require "pry"; binding.pry
  #       fill_top(character)
  #       fill_middle(character)
  #       fill_bottom(character)
  #     end
  #     write_lines
  #     File.write(ARGV[0], " \n\n\n\n", mode: "a")
  #   end
  # end
  #
  # def fill_top(character)
  #   @top << @@pairs[character][0]
  # end
  #
  # def fill_middle(character)
  #   @middle << @@pairs[character][1]
  # end
  #
  # def fill_bottom(character)
  #   @bottom << @@pairs[character][2]
  # end
  #
  # def write_lines
  #   File.open(ARGV[0], "w") do |out|
  #     out.write("#{@top.join("")}\n")
  #     out.write("#{@middle.join("")}\n")
  #     out.write("#{@bottom.join("")}\n")
  #   end
  # end

end
