defmodule AdventOfCode.Day02 do
  def part1(args) do
    {h, v} =
      String.trim(args)
      |> String.split("\n")
      |> Enum.map(fn x -> String.split(x) |> List.to_tuple() end)
      |> Enum.reduce({0, 0}, fn cmd, {x, y} ->
        case cmd do
          {"forward", f} -> {x + String.to_integer(f), y}
          {"down", d} -> {x, y + String.to_integer(d)}
          {"up", d} -> {x, y - String.to_integer(d)}
        end
      end)

    h * v
  end

  def part2(args) do
    {h, v, aim} =
      String.trim(args)
      |> String.split("\n")
      |> Enum.map(fn x -> String.split(x) |> List.to_tuple() end)
      |> Enum.reduce({0, 0, 0}, fn cmd, {x, y, a} ->
        case cmd do
          {"forward", f} -> {x + String.to_integer(f), y + a * String.to_integer(f), a}
          {"down", d} -> {x, y, a + String.to_integer(d)}
          {"up", d} -> {x, y, a - String.to_integer(d)}
        end
      end)

    h * v
  end
end
