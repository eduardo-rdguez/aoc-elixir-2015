defmodule Day5Test do
  use ExUnit.Case
  doctest AocElixir

  alias AocElixir.Day5

  test "ugknbfddgicrmopn is nice" do
    assert Day5.is_nice_string("ugknbfddgicrmopn") == true
  end

  test "jchzalrnumimnmhp is naughty" do
    assert Day5.is_nice_string("jchzalrnumimnmhp") == false
  end

  test "haegwjzuvuyypxyu is naughty" do
    assert Day5.is_nice_string("haegwjzuvuyypxyu") == false
  end

  test "dvszwmarrgswjxmb is naughty" do
    assert Day5.is_nice_string("dvszwmarrgswjxmb") == false
  end

  test "there are 258 nice strings in test file" do
    assert Day5.first_part() == 258
  end

  test "qjhvhtzxzqqjkmpb is nice" do
    assert Day5.is_nice_string_v2("qjhvhtzxzqqjkmpb") == true
  end

  test "xxyxx is nice" do
    assert Day5.is_nice_string_v2("xxyxx") == true
  end

  test "uurcxstgmygtbstg is naughty" do
    assert Day5.is_nice_string_v2("uurcxstgmygtbstg") == false
  end

  test "ieodomkazucvgmuy is naughty" do
    assert Day5.is_nice_string_v2("ieodomkazucvgmuy") == false
  end

  test "there are 53 nice strings in test file considering the new rules" do
    assert Day5.second_part() == 53
  end
end
