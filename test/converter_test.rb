require 'minitest/autorun'
require 'minitest/pride'
require './lib/line_reader'
require './lib/line'
require './lib/converter'
require 'mocha/minitest'


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

  def test_it_gets_character_converts_to_braille
    all_lines = LineReader.new("lib/row_braille.txt").complete
    converter = Converter.new(all_lines)

    converter.stubs(:to_braille).returns("0..0...0..00.0.0..0...0..00.0.")

    assert_equal 30, converter.to_braille.length
  end

  def test_it_gets_character_converts_to_english
    all_lines = LineReader.new("lib/row_braille.txt").complete
    converter = Converter.new(all_lines)

    converter.stubs(:to_english).returns("hi there")

    assert_equal 8, converter.to_english.length
  end

end
