defmodule WebRomanNumerals do

  @arabic_to_roman [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]
    
  def convert(0), do: ""
  def convert(number) do
    convert(@arabic_to_roman, number, "")
  end

  def convert([], 0, numeral), do: numeral <> ""
  def convert(conversions = [{arabic, roman} | remaining], number, numeral) do
    if number >= arabic do
      convert(conversions, number - arabic, numeral <> roman)
    else
      convert(remaining, number, numeral)
    end
  end

end
