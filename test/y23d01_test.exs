defmodule Year2023.Day01.Test do
  use ExUnit.Case, async: true

  @example_part1 """
  1abc2
  pqr3stu8vwx
  a1b2c3d4e5f
  treb7uchet
  """

  test "part 1 parse: returns correct" do
    expected = [12, 38, 15, 77]
    actual = Year2023.Day01.Part1.parse(@example_part1)
    assert actual == expected
  end

  test "part 1: example should be correct" do
    input = [12, 38, 15, 77]
    expected = 142
    assert Year2023.Day01.Part1.solve(input) == expected
  end

  test "part 1: example should be x" do
    input = [12, 38, 15, 77]
    expected = 142
    assert Year2023.Day01.Part1.solve(input) == expected
  end

  @example_part2 """
  two1nine
  eightwothree
  abcone2threexyz
  xtwone3four
  4nineeightseven2
  zoneight234
  7pqrstsixteen
  """

  test "part 2 parse: returns correct" do
    expected = [12, 38, 15, 77]
    actual = Year2023.Day01.Part2.parse(@example_part1)
    assert actual == expected
  end

  test "part 2: x should be x" do
    input = [29, 83, 13, 24, 42, 14, 76]
    expected = 281
    assert Year2023.Day01.Part2.solve(input) == expected
  end
end
