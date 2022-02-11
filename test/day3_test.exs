defmodule Day3Test do
  use ExUnit.Case
  doctest AocElixir

  test "> delivers presents to 2 houses" do
    assert AocElixir.Day3.santa_delivery(">") == 2
  end

  test "^>v< delivers presents to 4 houses in a square" do
    assert AocElixir.Day3.santa_delivery("^>v<") == 4
  end

  test "^v^v^v^v^v delivers a bunch of presents in only 2 houses" do
    assert AocElixir.Day3.santa_delivery("^v^v^v^v^v") == 2
  end

  test "^v delivers presents to 3 houses" do
    assert AocElixir.Day3.robot_santa_delivery("^v") == 3
  end

  test "^>v< delivers presents to 3 houses" do
    assert AocElixir.Day3.robot_santa_delivery("^v") == 3
  end

  test "^v^v^v^v^v delivers presents to 3 houses" do
    assert AocElixir.Day3.robot_santa_delivery("^v^v^v^v^v") == 11
  end

  test "Santa is delivering presents to an infinite two-dimensional grid of houses" do
    assert AocElixir.Day3.first_puzzle() == 2572
  end

  test "Santa creates a robot version of himself, Robo-Santa, to deliver presents with him" do
    assert AocElixir.Day3.second_puzzle() == 2631
  end
end
