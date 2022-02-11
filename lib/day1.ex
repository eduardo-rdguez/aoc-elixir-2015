defmodule AocElixir.Day1 do
  @moduledoc """
    Documentation for `Day1`.
  """

  def first_puzzle do
    read_test_file()
    |> calculate_floor()
  end

  def second_puzzle do
    read_test_file()
    |> find_position()
  end

  defp read_test_file do
    File.read!("resources/day1.txt")
  end

  def calculate_floor(instrucctions) do
    instrucctions
    |> String.split("", trim: true)
    |> Enum.reduce(0, fn instrucction, current_floor -> current_floor + elevator(instrucction) end)
  end

  def find_position(instrucctions) do
    instrucctions
    |> String.split("", trim: true)
    |> calculate_floor(0, 0)
  end

  defp calculate_floor(_, -1, position), do: position

  defp calculate_floor([instrucction | instrucctions], current_floor, position) do
    new_floor = elevator(instrucction) + current_floor
    calculate_floor(instrucctions, new_floor, position + 1)
  end

  defp elevator(")"), do: -1
  defp elevator("("), do: 1
end
