defmodule WebRomanNumeralsTest do
  use ExUnit.Case
  doctest WebRomanNumerals

  test "a 0 returns an empty string" do
    assert WebRomanNumerals.convert(0) == ""
  end

  test "a 1 returns an I" do
    assert WebRomanNumerals.convert(1) == "I"
  end

  test "a 2 returns a II" do
    assert WebRomanNumerals.convert(2) == "II"
  end

  test "a 3 returns a III" do
    assert WebRomanNumerals.convert(3) == "III"
  end

  test "a 5 returns a V" do
    assert WebRomanNumerals.convert(5) == "V"
  end

  test "a 6 returns a VI" do
    assert WebRomanNumerals.convert(6) == "VI"
  end

  test "a 7 returns a VII" do
    assert WebRomanNumerals.convert(7) == "VII"
  end

  test "a 10 returns an X" do
    assert WebRomanNumerals.convert(10) == "X"
  end

  test "an 11 returns XI" do
    assert WebRomanNumerals.convert(11) == "XI"
  end

  test "4 returns IV" do
    assert WebRomanNumerals.convert(4) == "IV"
  end

  test "9 returns IX" do
    assert WebRomanNumerals.convert(9) == "IX"
  end

  test "18 returns XVIII" do
    assert WebRomanNumerals.convert(18) == "XVIII"
  end

  test "20 returns XX" do
    assert WebRomanNumerals.convert(20) == "XX"
  end

  test "40 returns XL" do
    assert WebRomanNumerals.convert(40) == "XL"
  end

  test "50 returns L" do
    assert WebRomanNumerals.convert(50) == "L"
  end

end
