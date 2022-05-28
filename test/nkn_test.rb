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

  test "print \"nakano_pixy\n\"" do
    source = ""
    expected = "nakano_pixy\n"
    expected.each_char do |char|
      source += "な" * char.ord
      source += "か"
      source += "の"
    end
    source += "の" if source.chars.last != "の" # exit(0)

    out = StringIO.new
    result = ::Nkn.run(source, out: out)
    assert_equal 0, result
    assert_equal expected, out.string
  end
end
