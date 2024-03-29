defmodule AocElixir.Day3 do
  @moduledoc """
    Documentation for `Day3`.
  """

  @spec first_puzzle() :: integer()
  def first_puzzle do
    read_test_file()
    |> santa_delivery()
  end

  @spec second_puzzle() :: integer()
  def second_puzzle do
    read_test_file()
    |> robot_santa_delivery()
  end

  @spec read_test_file :: binary()
  defp read_test_file do
    File.read!("resources/day3.txt")
  end

  @spec santa_delivery(binary()) :: integer()
  def santa_delivery(path) do
    path
    |> String.split("", trim: true)
    |> Enum.reduce([{0, 0}], fn step, santa_steps -> run_path_santa(step, santa_steps) end)
    |> Enum.uniq()
    |> Enum.count()
  end

  @spec robot_santa_delivery(binary()) :: integer()
  def robot_santa_delivery(path) do
    path
    |> String.split("", trim: true)
    |> Enum.chunk_every(2)
    |> Enum.reduce([[{0, 0}], [{0, 0}]], fn step, steps -> run_path_robot_santa(step, steps) end)
    |> List.flatten()
    |> Enum.uniq()
    |> Enum.count()
  end

  @spec run_path_santa(String.t(), List.t(String.t())) :: List.t(String.t())
  defp run_path_santa(step, santa_steps) do
    new_santa_step = santa_steps |> List.first() |> evaluate(step)
    [new_santa_step | santa_steps]
  end

  defp run_path_robot_santa([santa_step, robot_step], [santa_steps, robot_steps]) do
    new_santa_step = santa_steps |> List.first() |> evaluate(santa_step)
    new_robot_step = robot_steps |> List.first() |> evaluate(robot_step)

    [[new_santa_step | santa_steps], [new_robot_step | robot_steps]]
  end

  @spec evaluate({integer(), integer()}, String.t()) :: {integer(), integer()}
  defp evaluate({x, y}, ">"), do: {x + 1, y}
  defp evaluate({x, y}, "<"), do: {x - 1, y}
  defp evaluate({x, y}, "^"), do: {x, y + 1}
  defp evaluate({x, y}, "v"), do: {x, y - 1}
end
