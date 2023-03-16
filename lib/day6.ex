defmodule AocElixir.Day6 do
  @moduledoc """
    Documentation for `Day6`.
  """

  @instruction_regex ~r/(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/
  @default_light_state false
  @default_matrix_size 999
  @zero 0

  @spec first_part :: integer()
  def first_part do
    init_matrix(@default_matrix_size)
    |> light_handler(read_instructions(), &switch/2)
    |> Enum.count(& &1)
  end

  @spec second_part :: integer()
  def second_part do
    init_matrix(@default_matrix_size, @zero)
    |> light_handler(read_instructions(), &brightness/2)
    |> Enum.sum()
  end

  @spec read_instructions :: File.Stream.t()
  defp read_instructions do
    File.stream!("resources/day6.txt")
  end

  @spec map_instruction(String.t()) :: {String.t(), integer(), integer(), integer(), integer()}
  defp map_instruction(instruction) do
    [instruction, x1, y1, x2, y2] = Regex.run(@instruction_regex, instruction) |> Kernel.tl()
    x1 = String.to_integer(x1)
    x2 = String.to_integer(x2)
    y1 = String.to_integer(y1)
    y2 = String.to_integer(y2)
    {instruction, x1, y1, x2, y2}
  end

  @spec light_handler(map(), List.t(String.t()), fun()) :: List.t(boolean() | integer())
  def light_handler(matrix, instructions, operation) do
    instructions
    |> Enum.map(&map_instruction/1)
    |> activate_lights(matrix, operation)
    |> Map.values()
  end

  @spec activate_lights(List.t(), map(), fun()) :: map()
  defp activate_lights([], matrix, _), do: matrix

  defp activate_lights([hd | tl], matrix, operation) do
    {instruction, x1, y1, x2, y2} = hd

    matrix =
      for(x <- x1..x2, do: for(y <- y1..y2, do: {x, y, instruction}))
      |> List.flatten()
      |> update_matrix(matrix, operation)

    activate_lights(tl, matrix, operation)
  end

  @spec update_matrix(List.t(), map(), fun()) :: map()
  defp update_matrix([], matrix, _), do: matrix

  defp update_matrix([hd | tl], matrix, operation) do
    {x, y, instruction} = hd
    new_matrix = Map.put(matrix, {x, y}, operation.(instruction, matrix[{x, y}]))
    update_matrix(tl, new_matrix, operation)
  end

  @spec switch(String.t(), boolean()) :: boolean()
  def switch("turn on", _), do: true
  def switch("turn off", _), do: false
  def switch("toggle", state), do: not state

  @spec brightness(String.t(), integer()) :: integer()
  def brightness("turn on", n), do: n + 1
  def brightness("turn off", 0), do: 0
  def brightness("turn off", n), do: n - 1
  def brightness("toggle", n), do: n + 2

  @spec init_matrix(integer(), boolean() | integer()) :: map()
  def init_matrix(size, lights_state \\ @default_light_state) do
    for x <- @zero..size, y <- @zero..size, into: %{}, do: {{x, y}, lights_state}
  end
end
