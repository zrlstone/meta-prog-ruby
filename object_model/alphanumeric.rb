class String
  def to_alphanumeric
    gsub /[^\w\s]/, ''
  end
end

require 'test/unit'

class ToAlphanumericTest < Test::Unit::TestCase
  def test_strip_non_alphanumeric_characters
    assert_equal '3 the Magic Number', '#3, the *Magic, Number*?'.to_alphanumeric
  end
end

class D
  def x; 'x'; end
end

class D
  def y; 'y'; end
end

obj = D.new
p obj.x
p obj.y