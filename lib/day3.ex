defmodule AocElixir.Day3 do
  @moduledoc """
    Documentation for `Day3`.
  """

  def first_part do
    read_test_file()
    |> santa_delivery()
  end

  def second_part do
    read_test_file()
    |> robot_santa_delivery()
  end

  defp read_test_file do
    File.read!("resources/day3.txt")
  end

  def santa_delivery(path) do
    path
    |> String.split("", trim: true)
    |> run_path_santa([{0, 0}])
    |> count_steps()
  end

  def robot_santa_delivery(path) do
    path
    |> String.split("", trim: true)
    |> Enum.chunk_every(2)
    |> run_path_robot_santa({[{0, 0}], [{0, 0}]})
    |> count_steps()
  end

  defp count_steps(steps) do
    steps
    |> Enum.uniq()
    |> Enum.count()
  end

  defp run_path_santa([], santa_steps), do: santa_steps

  defp run_path_santa([step | tail], santa_steps) do
    new_santa_step = evaluate_by_steps(santa_steps, step)
    run_path_santa(tail, santa_steps ++ [new_santa_step])
  end

  defp run_path_robot_santa([], {santa_steps, robot_steps}), do: santa_steps ++ robot_steps

  defp run_path_robot_santa([[santa_step, robot_step] | tail], {santa_steps, robot_steps}) do
    new_santa_step = evaluate_by_steps(santa_steps, santa_step)
    new_robot_step = evaluate_by_steps(robot_steps, robot_step)

    steps = {santa_steps ++ [new_santa_step], robot_steps ++ [new_robot_step]}
    run_path_robot_santa(tail, steps)
  end

  defp evaluate_by_steps(steps, step) do
    steps
    |> List.last()
    |> evaluate(step)
  end

  defp evaluate({x, y}, ">"), do: {x + 1, y}
  defp evaluate({x, y}, "<"), do: {x - 1, y}
  defp evaluate({x, y}, "^"), do: {x, y + 1}
  defp evaluate({x, y}, "v"), do: {x, y - 1}
end
