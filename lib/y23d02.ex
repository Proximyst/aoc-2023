defmodule Year2023.Day02.Part1 do
  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp parse_set(set) do
    set
    # ["8 green", "6 red"]
    |> Enum.map(&String.split(&1, " ", trim: true))
    # [["1", "green"], ["2", "blue"]]
    |> Enum.flat_map(fn [count, colour] ->
      [{String.to_atom(colour), String.to_integer(count)}]
    end)
    # [green: 1, blue: 2]
    |> Enum.into(%{})
  end

  defp parse_split_line(["Game", id, sets]) do
    game_id =
      id
      |> String.split(":")
      |> List.first()
      |> String.to_integer()

    game_sets =
      sets
      |> String.split(";", trim: true)
      |> Enum.map(&String.split(&1, ",", trim: true))
      |> Enum.map(&parse_set/1)

    {game_id, game_sets}
  end

  defp parse_line(input) when is_bitstring(input) do
    input
    |> String.split(" ", trim: true, parts: 3)
    |> parse_split_line()
  end

  @max_red 12
  @max_green 13
  @max_blue 14

  defp possible_set(set),
    do:
      Map.get(set, :red, 0) <= @max_red &&
        Map.get(set, :green, 0) <= @max_green &&
        Map.get(set, :blue, 0) <= @max_blue

  defp possible_game({_, sets}), do: Enum.all?(sets, &possible_set/1)

  def solve(input) do
    input
    |> Enum.filter(&possible_game/1)
    |> Enum.map(fn {id, _} -> id end)
    |> Enum.sum()
  end
end

defmodule Year2023.Day02.Part2 do
  defp largest(colour, sets) do
    sets
    |> Enum.map(&Map.get(&1, colour))
    |> Enum.filter(fn x -> !is_nil(x) end)
    |> Enum.max()
  end

  defp power({_, sets}) do
    largest(:green, sets) * largest(:blue, sets) * largest(:red, sets)
  end

  def solve(input) do
    input
    |> Enum.map(&power/1)
    |> Enum.sum()
  end
end

defmodule Mix.Tasks.Y23D02 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/y23d02.txt")

    IO.puts("---- Part 1 ----")
    parsed = Year2023.Day02.Part1.parse(input)
    part1 = Year2023.Day02.Part1.solve(parsed)
    IO.puts("Part 1: #{part1}")

    IO.puts("---- Part 2 ----")
    parsed = Year2023.Day02.Part1.parse(input)
    part2 = Year2023.Day02.Part2.solve(parsed)
    IO.puts("Part 2: #{part2}")
  end
end
