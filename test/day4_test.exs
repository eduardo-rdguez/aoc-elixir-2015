defmodule Day4Test do
  use ExUnit.Case
  doctest AocElixir

  alias AocElixir.Day4

  test "secret key is abcdef, the MD5 hash starting with five zeroes" do
    assert Day4.find_hash("abcdef", "00000") == "609043"
  end

  test "secret key is pqrstuv, the MD5 hash starting with five zeroes" do
    assert Day4.find_hash("pqrstuv", "00000") == "1048970"
  end

  test "secret key is bgvyzdsv, the MD5 hash starting with five zeroes" do
    assert Day4.solve_puzzle("00000") == "254575"
  end

  test "secret key is bgvyzdsv, the MD5 hash starting with six zeroes" do
    assert Day4.solve_puzzle("000000") == "1038736"
  end
end
