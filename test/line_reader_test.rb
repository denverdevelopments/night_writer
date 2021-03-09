require 'minitest/autorun'
require 'minitest/pride'
require './lib/line_reader'
require './lib/line'

class LineReaderTest < Minitest::Test
  def test_it_exists
    read_from = "lib/sample_one.txt"
    reader = LineReader.new(read_from)

    assert_instance_of LineReader, reader
  end

  def test_it_reads_no_lines
    read_from = "lib/sample_empty.txt"
    reader = LineReader.new(read_from)

    assert_equal "", reader.complete.first.text
  end

  def test_it_reads_one_line
    read_from = "lib/sample_one.txt"
    reader = LineReader.new(read_from)

    assert_equal "abc", reader.complete.first.text
  end

  def test_it_reads_multiple_lines
    read_from = "lib/sample_two.txt"
    reader = LineReader.new(read_from)

    assert_equal "abc", reader.complete.first.text
    assert_equal "de f g", reader.complete[1].text
  end

  def test_it_reads_spaces
    read_from = "lib/sample_two.txt"
    reader = LineReader.new(read_from)

    assert_equal "e", reader.complete[1].text[1]
    assert_equal " ", reader.complete[1].text[2]
    assert_equal " ", reader.complete[1].text[4]
  end

  def test_it_reads_in_braille
    read_from = "lib/row_braille.txt"
    reader = LineReader.new(read_from)

    assert_equal "0.0.0.0.0.", reader.complete[0].text
    assert_equal "00.00.0..0", reader.complete[1].text
    assert_equal "....0.0.0.", reader.complete[2].text
  end

  def test_it_reads_in_braille_80_dot_max
    read_from = "lib/row_braille_82.txt"
    reader = LineReader.new(read_from)

    expected1 = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0."
    expected2 = "................................................................................"

    assert_equal 80, reader.complete[0].text.length
    assert_equal expected1, reader.complete[0].text
    assert_equal 80, reader.complete[1].text.length
    assert_equal expected2, reader.complete[1].text
    assert_equal 80, reader.complete[2].text.length
    assert_equal expected2, reader.complete[2].text
    assert_equal "0.", reader.complete[3].text
    assert_equal "..", reader.complete[4].text
    assert_equal "..", reader.complete[5].text
  end

end
