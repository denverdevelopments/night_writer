require 'minitest/autorun'
require 'minitest/pride'
require './lib/line_reader'
require './lib/line'

class LineReaderTest < Minitest::Test
  def test_reader_exists
    read_from = "lib/sample_file.txt"
    reader = LineReader.new(read_from)

    assert_instance_of LineReader, reader
  end

  def test_reader_has_lines
    read_from = "lib/sample_file.txt"
    reader = LineReader.new(read_from)

    assert_equal "abc", reader.complete.first.text
  end

end
