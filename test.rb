# ENV['APP_ENV'] = 'test'

require './main'
require 'test/unit'
require 'rack/test'

class TestLinear < Test::Unit::TestCase
  def test_calculate
    assert_equal(0,Linear.new(1,0).calculate)
    assert_equal(1,Linear.new(1,-1).calculate)
    assert_equal(-0.5,Linear.new(2,1).calculate)
    assert_equal(Float::INFINITY,Linear.new(0,-1).calculate)
    assert_equal(Float::NAN,Linear.new(0,0).calculate)
  end

end

class TestQuadratic < Test::Unit::TestCase
  def test_calculate
    assert_equal([-5,1],Quadratic.new(1,4,-5).calculate)
    assert_equal("Error( discriminant <0)",Quadratic.new(1,4,5).calculate)
    assert_equal(0,Quadratic.new(0,1,0).calculate)
    assert_equal([1,1],Quadratic.new(1,-2,1).calculate)
    assert_equal([-1,1],Quadratic.new(1,0,-1).calculate)
    assert_equal(Float::NAN,Quadratic.new(0,0,0).calculate)

  end

end
