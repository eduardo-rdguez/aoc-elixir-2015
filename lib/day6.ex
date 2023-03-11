defmodule AocElixir.Day6 do
  @moduledoc """
    Documentation for `Day6`.
  """

  @instruction_regex ~r/(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/
  @init_state_lights false
  @matrix_size 999

  def first_part() do
    init_matrix(@matrix_size)
    |> light_handler(read_instructions())
  end

  defp read_instructions() do
    File.stream!("resources/day6.txt")
  end

  defp map_instruction(instruction) do
    [instruction, x1, y1, x2, y2] = Regex.run(@instruction_regex, instruction) |> Kernel.tl()
    x1 = String.to_integer(x1)
    x2 = String.to_integer(x2)
    y1 = String.to_integer(y1)
    y2 = String.to_integer(y2)
    {instruction, x1, y1, x2, y2}
  end

  def light_handler(matrix, instructions) do
    instructions
    |> Enum.map(&map_instruction/1)
    |> activate_lights(matrix)
    |> Map.values()
    |> Enum.count(& &1)
  end

  defp activate_lights([], matrix), do: matrix

  defp activate_lights([{instruction, x1, y1, x2, y2} | tl], matrix) do
    matrix =
      for(x <- x1..x2, do: for(y <- y1..y2, do: {x, y, instruction}))
      |> List.flatten()
      |> update_matrix(matrix)

    activate_lights(tl, matrix)
  end

  defp update_matrix([], matrix), do: matrix

  defp update_matrix([{x, y, instruction} | tl], matrix) do
    new_matrix = Map.put(matrix, {x, y}, switch(instruction, matrix[{x, y}]))
    update_matrix(tl, new_matrix)
  end

  defp switch("turn on", _), do: true
  defp switch("turn off", _), do: false
  defp switch("toggle", state), do: not state

  def init_matrix(size, init_state_lights \\ @init_state_lights) do
    for x <- 0..size, y <- 0..size, into: %{}, do: {{x, y}, init_state_lights}
  end
end
