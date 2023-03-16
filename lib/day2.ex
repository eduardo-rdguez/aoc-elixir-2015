defmodule AocElixir.Day2 do
  @moduledoc """
    Documentation for `Day2`.
  """

  @spec first_puzzle :: integer()
  def first_puzzle do
    read_test_file()
    |> calculate_required_wrapping()
  end

  @spec second_puzzle :: integer()
  def second_puzzle do
    read_test_file()
    |> calculate_required_ribbon()
  end

  @spec read_test_file :: List.t(String.t())
  defp read_test_file do
    File.read!("resources/day2.txt")
    |> String.split("\n", trim: true)
  end

  @spec calculate_required_wrapping(List.t(String.t())) :: integer()
  def calculate_required_wrapping(boxes) do
    boxes
    |> Enum.map(fn box -> box |> String.split("x", trim: true) end)
    |> Enum.reduce(0, fn dimensions, feet -> feet + calculate_wrapping(dimensions) end)
  end

  @spec calculate_required_ribbon(List.t(String.t())) :: integer()
  def calculate_required_ribbon(boxes) do
    boxes
    |> Enum.map(fn box -> box |> String.split("x", trim: true) end)
    |> Enum.reduce(0, fn dimensions, feet -> feet + calculate_ribbon(dimensions) end)
  end

  @spec calculate_wrapping(List.t(String.t())) :: integer()
  defp calculate_wrapping(dimensions) do
    [l, w, h] = dimensions |> Enum.map(&String.to_integer(&1)) |> Enum.sort()
    2 * l * w + 2 * w * h + 2 * h * l + l * w
  end

  @spec calculate_ribbon(List.t(String.t())) :: integer()
  defp calculate_ribbon(dimensions) do
    [l, w, h] = dimensions |> Enum.map(&String.to_integer(&1)) |> Enum.sort()
    l * w * h + l * 2 + w * 2
  end
end
