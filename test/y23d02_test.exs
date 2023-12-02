defmodule Year2023.Day02.Test do
  use ExUnit.Case, async: true

  @example_part1 """
  Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
  Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
  Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
  Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
  Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
  """

  test "part 1 parse: returns correct" do
    expected = [
      {1, [%{blue: 3, red: 4}, %{red: 1, green: 2, blue: 6}, %{green: 2}]},
      {2, [%{blue: 1, green: 2}, %{green: 3, blue: 4, red: 1}, %{green: 1, blue: 1}]},
      {3, [%{green: 8, blue: 6, red: 20}, %{blue: 5, red: 4, green: 13}, %{green: 5, red: 1}]},
      {4, [%{green: 1, red: 3, blue: 6}, %{green: 3, red: 6}, %{green: 3, blue: 15, red: 14}]},
      {5, [%{red: 6, blue: 1, green: 3}, %{blue: 2, red: 1, green: 2}]}
    ]

    actual = Year2023.Day02.Part1.parse(@example_part1)
    assert actual == expected
  end

  test "part 1: example should be correct" do
    input = [
      {1, [%{blue: 3, red: 4}, %{red: 1, green: 2, blue: 6}, %{green: 2}]},
      {3, [%{red: 20}]}
    ]

    expected = 1
    assert Year2023.Day02.Part1.solve(input) == expected
  end

  test "part 2: example should be correct" do
    input = [
      {1, [%{blue: 3, red: 4}, %{red: 1, green: 2, blue: 6}, %{green: 2}]},
      {2, [%{blue: 1, green: 2}, %{green: 3, blue: 4, red: 1}, %{green: 1, blue: 1}]},
      {3, [%{green: 8, blue: 6, red: 20}, %{blue: 5, red: 4, green: 13}, %{green: 5, red: 1}]},
      {4, [%{green: 1, red: 3, blue: 6}, %{green: 3, red: 6}, %{green: 3, blue: 15, red: 14}]},
      {5, [%{red: 6, blue: 1, green: 3}, %{blue: 2, red: 1, green: 2}]}
    ]
    expected = 2286
    assert Year2023.Day02.Part2.solve(input) == expected
  end
end
