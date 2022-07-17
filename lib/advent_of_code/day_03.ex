defmodule AdventOfCode.Day03 do
  import Nx

  def part1(args) do
    b = String.trim(args)
    |> String.split("\n")
    |> Enum.map(fn x ->
      String.to_charlist(x)
      |> Enum.map(fn
        ?1 -> 1
        ?0 -> 0
      end)
    end)

    l = length b
    s = Nx.divide(Nx.sum(Nx.tensor(b), axes: [0]), l)

    { gamma, _ } = Nx.to_flat_list(s) |> Enum.map(fn x -> if( x > 0.5, do: '1', else: '0') end) |> to_string |> Integer.parse(2)
    { epsilon, _ } = Nx.to_flat_list(s) |> Enum.map(fn x -> if( x < 0.5, do: '1', else: '0') end) |> to_string |> Integer.parse(2)

    gamma * epsilon 
  end

  def filter_at(list, x, co2 \\ false) do
    l = length list

    if l == 1 do
      Enum.at(list,0) |> Enum.map(fn x-> if(x==0, do: ?0, else: ?1) end) |> to_string |> Integer.parse(2)
    else
      s = Nx.tensor(list) |> Nx.sum(axes: [0]) |> Nx.divide(l) |> Nx.to_flat_list

      most = cond do
          Enum.at(s, x) < 0.5 -> 0
          true -> 1
      end
        
      if co2 do
        Enum.filter(list, fn l -> Enum.at(l, x) != most end) |> filter_at(x+1, co2)
      else
        Enum.filter(list, fn l -> Enum.at(l, x) == most end) |> filter_at(x+1, co2)
      end

    end
  end

  def part2(args) do
    s = String.trim(args)
    |> String.split("\n")
    |> Enum.map(fn x ->
      String.to_charlist(x)
      |> Enum.map(fn
        ?1 -> 1
        ?0 -> 0
      end)
    end)
    
    {gen, _} = filter_at(s, 0, false)
    {scr, _} = filter_at(s, 0, true)


    gen * scr
  end
end
