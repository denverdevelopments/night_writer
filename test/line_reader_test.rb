require 'minitest/autorun'
require 'minitest/pride'
require './lib/line_reader'
require './lib/line'

class LineReaderTest < Minitest::Test
  def test_reader_exists
    reader = LineReader.new

    assert_instance_of LineReader, reader
  end

end
