defmodule Day5Test do
  use ExUnit.Case
  doctest AocElixir

  test "turn on 0,0 through 2,2" do
    matrix = AocElixir.Day6.init_matrix(999)
    instruction = "turn on 0,0 through 2,2"
    assert AocElixir.Day6.light_handler(matrix, [instruction]) == 9
  end

  test "turn on 0,0 through 999,999" do
    matrix = AocElixir.Day6.init_matrix(999)
    instruction = "turn on 0,0 through 999,999"
    assert AocElixir.Day6.light_handler(matrix, [instruction]) == 1_000_000
  end

  test "toggle 0,0 through 999,0" do
    matrix = AocElixir.Day6.init_matrix(999)
    instruction = "toggle 0,0 through 999,0"
    assert AocElixir.Day6.light_handler(matrix, [instruction]) == 1_000
  end

  test "turn off 499,499 through 500,500" do
    matrix = AocElixir.Day6.init_matrix(999, true)
    instruction = "turn off 499,499 through 500,500"
    assert AocElixir.Day6.light_handler(matrix, [instruction]) == 999_996
  end

  test "turn on 489,959 through 759,964" do
    matrix = AocElixir.Day6.init_matrix(999)
    instruction = "turn on 489,959 through 759,964"
    assert AocElixir.Day6.light_handler(matrix, [instruction]) == 1626
  end

  test "there are 569999 lights on in the file" do
    assert AocElixir.Day6.first_part() == 569_999
  end
end
