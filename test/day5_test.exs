defmodule Day5Test do
  use ExUnit.Case
  doctest AocElixir

  test "ugknbfddgicrmopn is nice" do
    assert AocElixir.Day5.is_nice_string("ugknbfddgicrmopn") == true
  end

  test "jchzalrnumimnmhp is naughty" do
    assert AocElixir.Day5.is_nice_string("jchzalrnumimnmhp") == false
  end

  test "haegwjzuvuyypxyu is naughty" do
    assert AocElixir.Day5.is_nice_string("haegwjzuvuyypxyu") == false
  end

  test "dvszwmarrgswjxmb is naughty" do
    assert AocElixir.Day5.is_nice_string("dvszwmarrgswjxmb") == false
  end

  test "there are 258 nice strings in test file" do
    assert AocElixir.Day5.first_part() == 258
  end
end
