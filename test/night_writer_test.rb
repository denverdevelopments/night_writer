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

  def test_it_gets_character_count_english
    all_lines = LineReader.new("lib/messages.txt").complete
    converter = Converter.new(all_lines)

    assert_equal 11, converter.get_count?
  end

  def test_it_gets_character_count_braille
    all_lines = LineReader.new("lib/row_braille_82.txt").complete
    converter = Converter.new(all_lines)

    assert_equal 246, converter.get_count?
  end
end
