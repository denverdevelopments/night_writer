require 'minitest/autorun'
require 'minitest/pride'
require './lib/line_reader'
require './lib/line'
require './lib/converter'

class ConverterTest < Minitest::Test
  def test_it_exists
    all_lines = LineReader.new("lib/messages.txt").complete
    converter = Converter.new(all_lines)

    assert_instance_of Converter, converter
  end

  def test_it_gets_character_count
    all_lines = LineReader.new("lib/messages.txt").complete
    converter = Converter.new(all_lines)

    assert_equal 11, converter.get_count?
  end

  def test_it_converts_to_braille
    read_from = "lib/messages.txt"
    all_lines = LineReader.new(read_from).complete
    converter = Converter.new(all_lines)
    converter.to_braille

    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    assert_equal expected, converter.to_braille
  end

  def test_it_converts_to_english
    read_from = "lib/row_braille.txt"
    all_lines = LineReader.new(read_from).complete
    converter = Converter.new(all_lines)
    converter.to_english

    assert_equal "hello", converter.to_braille
  end

end
