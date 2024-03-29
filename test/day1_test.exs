defmodule Day1Test do
  use ExUnit.Case
  doctest AocElixir

  alias AocElixir.Day1

  test "(()) and ()() both result in floor 0" do
    assert Day1.calculate_floor("()()") == 0
  end

  test "((( and (()(()( both result in floor 3" do
    assert Day1.calculate_floor("(((") == 3
    assert Day1.calculate_floor("(()(()(") == 3
  end

  test "))((((( also results in floor 3" do
    assert Day1.calculate_floor("))(((((") == 3
  end

  test "()) and ))( both result in floor -1 (the first basement level)" do
    assert Day1.calculate_floor("())") == -1
    assert Day1.calculate_floor("))(") == -1
  end

  test "))) and )())()) both result in floor -3" do
    assert Day1.calculate_floor(")))") == -3
    assert Day1.calculate_floor(")())())") == -3
  end

  test "To what floor do the instructions take Santa?" do
    assert Day1.first_puzzle() == 280
  end

  test ") causes him to enter the basement at character position 1" do
    assert Day1.find_position(")") == 1
  end

  test "()()) causes him to enter the basement at character position 5" do
    assert Day1.find_position("()())") == 5
  end

  test "What is the position of the character that causes Santa to first enter the basement?" do
    assert Day1.second_puzzle() == 1797
  end
end
