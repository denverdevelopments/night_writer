require 'minitest/autorun'
require 'minitest/pride'
require './lib/line_reader'
require './lib/line'
require './lib/converter'

class ConverterTest < Minitest::Test
  def test_converter_exists
    all_lines = LineReader.new("lib/messages.txt").complete
    converter = Converter.new(all_lines)

    assert_instance_of Converter, converter
  end

  def test_converts_one_lines
    read_from = "lib/messages.txt"
    converter = Converter.new(read_from)
    converter.to_braille

    # assert_equal "", converter.to_braille
  end

  def test_converts_multi_line
    read_from = "lib/sample_two.txt"
    converter = LineReader.new("lib/sample_two.txt")

    # assert_equal "abc", converter.complete.first.text
  end

end
