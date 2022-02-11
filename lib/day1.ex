defmodule AocElixir.Day1 do
  @moduledoc """
    Documentation for `Day1`.
  """

  def first_puzzle do
    read_test_file()
    |> calculate_floor()
  end

  defp read_test_file do
    File.read!("resources/day1.txt")
  end

  def calculate_floor(instrucctions) do
    instrucctions
    |> String.split("", trim: true)
    |> Enum.reduce(0, fn instrucction, floor -> elevator(instrucction) + floor end)
  end

  defp elevator(")"), do: -1
  defp elevator("("), do: 1
end
