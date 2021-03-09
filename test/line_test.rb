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
    assert_equal [], line.top
    assert_equal [], line.middle
    assert_equal [], line.bottom
    assert_equal [], line.all
  end

  def test_has_text_attribute
    line = Line.new("abc")

    assert_equal "abc", line.text
  end

  def test_scans_line
    line = Line.new("abc")
    line.scan_line

    assert_equal ["O."], line.top
    assert_equal [".."], line.middle
    assert_equal [".."], line.bottom
  end

  def test_can_fill_top
    line = Line.new("abc")
    line.fill_top("a")

    assert_equal ["O."], line.top
  end

  def test_can_fill_middle
    line = Line.new("abc")
    line.fill_middle("a")

    assert_equal [".."], line.middle
  end

  def test_can_fill_bottom
    line = Line.new("abc")
    line.fill_bottom("a")

    assert_equal [".."], line.bottom
  end

  def test_it_can_scan_row
    line = Line.new("abc")
    assert_equal [], line.all

    line.scan_row

    assert_equal "O.", line.all[0]
    assert_equal "..", line.all[1]
    assert_equal "..", line.all[2]
      expected = ["O.", "..", ".."]
    assert_equal expected, line.all
    assert_equal 3, line.all.size
  end

end
