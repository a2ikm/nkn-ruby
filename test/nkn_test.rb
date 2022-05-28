# frozen_string_literal: true

require "test_helper"
require "stringio"

class NknTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::Nkn.const_defined?(:VERSION)
    end
  end

  test "execute なかなかのなかの" do
    out = StringIO.new
    result = ::Nkn.run("なかなかのなかの", out: out)
    assert_equal 0, result

    expected = [1, 2, 1].pack("U*")
    assert_equal expected, out.string
  end
end
