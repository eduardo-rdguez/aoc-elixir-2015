defmodule AocElixir.Day5 do
  @moduledoc """
    Documentation for `Day5`.
  """

  @vowels ~r/(.*a.*|.*e.*|.*i.*|.*o.*|.*u.*){3}/
  @disallowed ~r/(ab|cd|pq|xy)/
  @appears_twice ~r/(.)\1+/

  def first_part() do
    read_test_file()
    |> find_nice_strings()
  end

  defp read_test_file() do
    File.read!("resources/day5.txt")
  end

  def find_nice_strings(strings) do
    strings
    |> String.split("\n", trim: true)
    |> Enum.map(fn string -> is_nice_string(string) end)
    |> Enum.count(& &1)
  end

  def is_nice_string(string) do
    contains_at_least_three_vowels(string) &&
      contains_at_least_one_letter_that_appears_twice(string) &&
      not contains_disallowed_substrings(string)
  end

  defp contains_at_least_three_vowels(string) do
    string
    |> String.match?(@vowels)
  end

  defp contains_at_least_one_letter_that_appears_twice(string) do
    string
    |> String.match?(@appears_twice)
  end

  defp contains_disallowed_substrings(string) do
    string
    |> String.match?(@disallowed)
  end
end
