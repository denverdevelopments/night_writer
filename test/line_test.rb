require 'minitest/autorun'
require 'minitest/pride'
require './lib/line'

class LineTest < Minitest::Test
  def test_reader_exists
    line = Line.new()

    assert_instance_of Line, line
  end

  def test_has_empty_text_attribute
    line = Line.new()

    assert_equal "", line.text
  end

  def test_has_text_attribute
    text = "abc"
    line = Line.new(text)

    assert_equal "abc", line.text
  end

end
