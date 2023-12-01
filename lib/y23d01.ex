defmodule Year2023.Day01.Part1 do
  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp first_last(list), do: [List.first(list), List.last(list)]

  defp parse_line(input) do
    input
    |> String.codepoints()
    |> Enum.map(&Integer.parse/1)
    |> Enum.reject(fn x -> x == :error end)
    |> Enum.map(fn {x, _} -> x end)
    |> first_last()
    |> Integer.undigits()
  end

  def solve(input) do
    input
    |> Enum.sum()
  end
end

defmodule Year2023.Day01.Part2 do
  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  # I've tried writing this as a nicer Enum.find_index and all, but this is just
  # simply the clearest & easiest to read.
  defp parse_digit(<<"1", _::binary>>, acc), do: [1 | acc]
  defp parse_digit(<<"2", _::binary>>, acc), do: [2 | acc]
  defp parse_digit(<<"3", _::binary>>, acc), do: [3 | acc]
  defp parse_digit(<<"4", _::binary>>, acc), do: [4 | acc]
  defp parse_digit(<<"5", _::binary>>, acc), do: [5 | acc]
  defp parse_digit(<<"6", _::binary>>, acc), do: [6 | acc]
  defp parse_digit(<<"7", _::binary>>, acc), do: [7 | acc]
  defp parse_digit(<<"8", _::binary>>, acc), do: [8 | acc]
  defp parse_digit(<<"9", _::binary>>, acc), do: [9 | acc]
  defp parse_digit(<<"one", _::binary>>, acc), do: [1 | acc]
  defp parse_digit(<<"two", _::binary>>, acc), do: [2 | acc]
  defp parse_digit(<<"three", _::binary>>, acc), do: [3 | acc]
  defp parse_digit(<<"four", _::binary>>, acc), do: [4 | acc]
  defp parse_digit(<<"five", _::binary>>, acc), do: [5 | acc]
  defp parse_digit(<<"six", _::binary>>, acc), do: [6 | acc]
  defp parse_digit(<<"seven", _::binary>>, acc), do: [7 | acc]
  defp parse_digit(<<"eight", _::binary>>, acc), do: [8 | acc]
  defp parse_digit(<<"nine", _::binary>>, acc), do: [9 | acc]
  defp parse_digit(_, acc), do: acc

  defp parse_digits(<<a, tail::binary>>, acc),
    do: parse_digits(tail, parse_digit(<<a, tail::binary>>, acc))

  defp parse_digits(<<a>>, acc), do: parse_digit(<<a>>, acc)
  defp parse_digits(<<>>, acc), do: acc
  defp parse_digits(line), do: parse_digits(line, [])

  defp first_last(list), do: [List.first(list), List.last(list)]

  defp parse_line(input) do
    input
    |> parse_digits()
    |> first_last()
    |> Enum.reverse()
    |> Integer.undigits()
  end

  def solve(input) do
    input
    |> Enum.sum()
  end
end

defmodule Mix.Tasks.Y23D01 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/y23d01.txt")

    IO.puts("---- Part 1 ----")
    parsed = Year2023.Day01.Part1.parse(input)
    part1 = Year2023.Day01.Part1.solve(parsed)
    IO.puts("Part 1: #{part1}")

    IO.puts("---- Part 2 ----")
    parsed = Year2023.Day01.Part2.parse(input)
    part2 = Year2023.Day01.Part2.solve(parsed)
    IO.puts("Part 2: #{part2}")
  end
end
