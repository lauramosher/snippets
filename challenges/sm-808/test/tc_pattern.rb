require_relative "../lib/pattern"
require "test/unit"

class TestPattern < Test::Unit::TestCase
  def test_pattern
    assert_equal([nil, nil, "HIT", nil], Pattern.new(pattern: "..x.").pattern )
    assert_equal([nil, nil, "HIT", nil], Pattern.new(pattern: "..X.").pattern )
    assert_equal([nil, nil, nil, nil], Pattern.new(pattern: "..0.").pattern )
    assert_equal([nil, nil, "HiHat", nil], Pattern.new(pattern: "..x.", display: "HiHat").pattern )
  end

  def test_failure
    assert_raise(ArgumentError) { Pattern.new() }
  end
end
