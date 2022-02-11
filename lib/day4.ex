defmodule AocElixir.Day4 do
  @moduledoc """
    Documentation for `Day4`.
  """

  def solve_puzzle(zeroes) do
    read_test_file()
    |> find_hash(zeroes)
  end

  defp read_test_file() do
    File.read!("resources/day4.txt")
  end

  def find_hash(secret_key, zeroes) do
    {_hash, counter} =
      0..10_000_000
      |> Stream.map(&Integer.to_string/1)
      |> Stream.map(&String.pad_leading(&1, 6, "0"))
      |> Stream.map(&{secret_key <> &1, &1})
      |> Stream.map(fn {seed, i} -> {:crypto.hash(:md5, seed), i} end)
      |> Stream.map(fn {hash, i} -> {Base.encode16(hash), i} end)
      |> Enum.find(fn {hash, _} -> String.starts_with?(hash, zeroes) end)

    counter
  end
end
