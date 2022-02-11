defmodule Day1Test do
  use ExUnit.Case
  doctest AocElixir

  test "(()) and ()() both result in floor 0" do
    assert AocElixir.Day1.calculate_floor("()()") == 0
  end

  test "((( and (()(()( both result in floor 3" do
    assert AocElixir.Day1.calculate_floor("(((") == 3
    assert AocElixir.Day1.calculate_floor("(()(()(") == 3
  end

  test "))((((( also results in floor 3" do
    assert AocElixir.Day1.calculate_floor("))(((((") == 3
  end

  test "()) and ))( both result in floor -1 (the first basement level)" do
    assert AocElixir.Day1.calculate_floor("())") == -1
    assert AocElixir.Day1.calculate_floor("))(") == -1
  end

  test "))) and )())()) both result in floor -3" do
    assert AocElixir.Day1.calculate_floor(")))") == -3
    assert AocElixir.Day1.calculate_floor(")())())") == -3
  end

  test "To what floor do the instructions take Santa?" do
    assert AocElixir.Day1.first_puzzle == 280
  end
end
