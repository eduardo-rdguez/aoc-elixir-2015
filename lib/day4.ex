defmodule AocElixir.Day4 do
  @moduledoc """
    Documentation for `Day4`.
  """

  def solve_puzzle(zeroes) do
    read_test_file()
    |> find_hash(zeroes)
  end

  defp read_test_file do
    File.read!("resources/day4.txt")
  end

  def find_hash(secret_key, zeroes) do
    {_hash, counter} =
      0..10_000_000
      |> Flow.from_enumerable()
      |> Flow.map(&Integer.to_string/1)
      |> Flow.map(&String.pad_leading(&1, String.length(zeroes), "0"))
      |> Flow.map(&{secret_key <> &1, &1})
      |> Flow.map(fn {seed, counter} -> {md5(seed), counter} end)
      |> Enum.find(fn {hash, _} -> String.starts_with?(hash, zeroes) end)

    counter
  end

  defp md5(seed) do
    :crypto.hash(:md5, seed)
    |> Base.encode16()
  end
end
