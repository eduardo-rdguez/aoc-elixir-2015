defmodule AocElixir.Day1 do
  @moduledoc """
    Documentation for `Day1`.
  """

  @spec first_puzzle :: integer()
  def first_puzzle do
    read_test_file()
    |> calculate_floor()
  end

  @spec second_puzzle :: integer()
  def second_puzzle do
    read_test_file()
    |> find_position()
  end

  @spec read_test_file :: binary()
  defp read_test_file do
    File.read!("resources/day1.txt")
  end

  @spec calculate_floor(binary()) :: integer()
  def calculate_floor(instructions) do
    instructions
    |> String.split("", trim: true)
    |> Enum.reduce(0, fn instruction, current_floor -> current_floor + elevator(instruction) end)
  end

  @spec find_position(binary()) :: integer()
  def find_position(instructions) do
    instructions
    |> String.split("", trim: true)
    |> calculate_floor(0, 0)
  end

  @spec calculate_floor(List.t(String.t()), integer(), integer()) :: integer()
  defp calculate_floor(_, -1, position), do: position

  defp calculate_floor([instruction | instructions], current_floor, position) do
    new_floor = elevator(instruction) + current_floor
    calculate_floor(instructions, new_floor, position + 1)
  end

  @spec elevator(String.t()) :: -1 | 1
  defp elevator(")"), do: -1
  defp elevator("("), do: 1
end
