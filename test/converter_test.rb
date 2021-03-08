require 'minitest/autorun'
require 'minitest/pride'
require './lib/line_reader'
require './lib/line'
require './lib/converter'

class ConverterTest < Minitest::Test
  def test_reader_exists
    read_from = "lib/sample_one.txt"
    all_lines = LineReader.new(read_from).complete
    reader = Converter.new(all_lines)

    assert_instance_of Converter, reader
  end

  def test_reader_reads_no_lines
    read_from = "lib/sample_empty.txt"
    reader = Converter.new(read_from)

    assert_equal "", reader.complete.first.text
  end

  def test_reader_reads_one_line
    read_from = "lib/sample_one.txt"
    reader = LineReader.new(read_from)

    assert_equal "abc", reader.complete.first.text
  end
  
end
