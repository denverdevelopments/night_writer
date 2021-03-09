require 'minitest/autorun'
require 'minitest/pride'
require './lib/line'

class LineTest < Minitest::Test
  def test_reader_exists
    line = Line.new()

    assert_instance_of Line, line
  end

  def test_has_attributes
    line = Line.new()

    assert_equal "", line.text
  end
end
