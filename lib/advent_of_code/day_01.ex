defmodule AdventOfCode.Day01 do
  def part1(args) do
    String.trim(args)
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
    |> count_deeper()
  end

  def count_deeper([]), do: 0
  def count_deeper([_a]), do: 0

  def count_deeper([a, b | rest]) when is_number(a) and is_number(b) do
    if(a < b, do: 1, else: 0) + count_deeper([b | rest])
  end

  def part2(args) do
    String.trim(args)
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
    |> count_deeperer()
  end

  def count_deeperer([a, b, c, d | rest]) do
    if(d > a, do: 1, else: 0) + count_deeperer([b, c, d | rest])
  end

  def count_deeperer(_), do: 0
end
