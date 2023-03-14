defmodule Day2Test do
  use ExUnit.Case
  doctest AocElixir

  alias AocElixir.Day2

  test "A present with dimensions 2x3x4 requires a total of 58 square feet" do
    assert Day2.calculate_required_wrapping(["2x3x4"]) == 58
  end

  test "A present with dimensions 1x1x10 requires a total of 42 square feet" do
    assert Day2.calculate_required_wrapping(["1x1x10"]) == 43
  end

  test "How many total square feet of wrapping paper should they order?" do
    assert Day2.first_puzzle() == 1_606_483
  end

  test "A present with dimensions 2x3x4 requires a total of 34 feet" do
    assert Day2.calculate_required_ribbon(["2x3x4"]) == 34
  end

  test "A present with dimensions 1x1x10 requires a total of 14 feet" do
    assert Day2.calculate_required_ribbon(["1x1x10"]) == 14
  end

  test "How many total feet of ribbon should they order?" do
    assert Day2.second_puzzle() == 3_842_356
  end
end
