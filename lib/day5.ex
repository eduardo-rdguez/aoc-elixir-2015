defmodule AocElixir.Day5 do
  @moduledoc """
    Documentation for `Day5`.
  """

  @vowels ~r/(.*a.*|.*e.*|.*i.*|.*o.*|.*u.*){3}/
  @disallowed_substrings ~r/(ab|cd|pq|xy)/
  @appears_twice ~r/(.)\1+/
  @two_letter_appears_twice ~r/(\w{2})\w*(\1)(?!\2)/
  @letter_between_them ~r/(\w)\w\1\w?/

  def first_part() do
    read_test_file()
    |> find_nice_strings()
  end

  def second_part() do
    read_test_file()
    |> find_nice_strings_v2()
  end

  defp read_test_file() do
    File.read!("resources/day5.txt")
  end

  defp find_nice_strings(strings) do
    strings
    |> String.split("\n", trim: true)
    |> Enum.map(&is_nice_string/1)
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
    |> String.match?(@disallowed_substrings)
  end

  defp find_nice_strings_v2(strings) do
    strings
    |> String.split("\n", trim: true)
    |> Enum.map(&is_nice_string_v2/1)
    |> Enum.count(& &1)
  end

  def is_nice_string_v2(string) do
    contains_a_pair_two_letters_that_appears_twice(string) &&
      contains_one_letter_that_repeats_with_one_letter_between_them(string)
  end

  defp contains_a_pair_two_letters_that_appears_twice(string) do
    string
    |> String.match?(@two_letter_appears_twice)
  end

  defp contains_one_letter_that_repeats_with_one_letter_between_them(string) do
    string
    |> String.match?(@letter_between_them)
  end
end
