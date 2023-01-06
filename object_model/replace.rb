def replace(array, original, replacement)
  array.map { |e| e==original ? replacement : e}
end

class Array
  def replace(original, replacement)
    self.map { |e| e==original ? replacement : e}
  end
end

require 'test/unit'
class ToAlphanumericTest < Test::Unit::TestCase
  def test_replace
    original = ['one', 'two', 'one', 'three']
    replaced = original.replace('one', 'zero') 
    assert_equal ['zero', 'two', 'zero', 'three'], replaced
  end
end

