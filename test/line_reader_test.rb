require 'minitest/autorun'
require 'minitest/pride'
require './lib/line_reader'
require './lib/line'

class LineReaderTest < Minitest::Test
  def test_reader_exists
    read_from = "lib/sample_one.txt"
    reader = LineReader.new(read_from)

    assert_instance_of LineReader, reader
  end

  def test_reader_reads_no_lines
    read_from = "lib/sample_empty.txt"
    reader = LineReader.new(read_from)

    assert_equal "", reader.complete.first.text
  end

  def test_reader_reads_one_line
    read_from = "lib/sample_one.txt"
    reader = LineReader.new(read_from)

    assert_equal "abc", reader.complete.first.text
  end

  def test_reader_reads_multiple_lines
    read_from = "lib/sample_two.txt"
    reader = LineReader.new(read_from)

    assert_equal "abc", reader.complete.first.text
    assert_equal "de f g", reader.complete[1].text
  end

  def test_reader_reads_spaces
    read_from = "lib/sample_two.txt"
    reader = LineReader.new(read_from)

    assert_equal "e", reader.complete[1].text[1]
    assert_equal " ", reader.complete[1].text[2]
    assert_equal " ", reader.complete[1].text[4]
  end
end
