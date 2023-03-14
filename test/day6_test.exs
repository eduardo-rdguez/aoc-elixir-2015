defmodule Day6Test do
  use ExUnit.Case
  doctest AocElixir

  alias AocElixir.Day6

  @moduletag timeout: 100_000

  test "turn on 0,0 through 2,2" do
    matrix = Day6.init_matrix(2)
    instruction = "turn on 0,0 through 2,2"
    lights = Day6.light_handler(matrix, [instruction], &Day6.switch/2)
    assert lights |> Enum.count(& &1) == 9
  end

  test "turn on 0,0 through 999,999" do
    matrix = Day6.init_matrix(999)
    instruction = "turn on 0,0 through 999,999"
    lights = Day6.light_handler(matrix, [instruction], &Day6.switch/2)
    assert lights |> Enum.count(& &1) == 1_000_000
  end

  test "toggle 0,0 through 999,0" do
    matrix = Day6.init_matrix(999)
    instruction = "toggle 0,0 through 999,0"
    lights = Day6.light_handler(matrix, [instruction], &Day6.switch/2)
    assert lights |> Enum.count(& &1) == 1_000
  end

  test "turn off 499,499 through 500,500" do
    matrix = Day6.init_matrix(999, true)
    instruction = "turn off 499,499 through 500,500"
    lights = Day6.light_handler(matrix, [instruction], &Day6.switch/2)
    assert lights |> Enum.count(& &1) == 999_996
  end

  test "turn on 489,959 through 759,964" do
    matrix = Day6.init_matrix(999)
    instruction = "turn on 489,959 through 759,964"
    lights = Day6.light_handler(matrix, [instruction], &Day6.switch/2)
    assert lights |> Enum.count(& &1) == 1626
  end

  test "there are 569999 lights on in the file" do
    assert Day6.first_part() == 569_999
  end

  test "turn on 0,0 through 0,0 would increase the total brightness by 1" do
    matrix = Day6.init_matrix(999, 0)
    instruction = "turn on 0,0 through 0,0"
    lights = Day6.light_handler(matrix, [instruction], &Day6.brightness/2) |> Enum.sum()
    assert lights == 1
  end

  test "toggle 0,0 through 999,999 would increase the total brightness by 2000000" do
    matrix = Day6.init_matrix(999, 0)
    instruction = "toggle 0,0 through 999,999"
    lights = Day6.light_handler(matrix, [instruction], &Day6.brightness/2) |> Enum.sum()
    assert lights == 2_000_000
  end

  test "the total brightness of all lights combined after following Santa's is 17836115" do
    assert Day6.second_part() == 17_836_115
  end
end
