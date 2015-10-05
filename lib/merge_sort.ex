defmodule MergeSort do
  def sort(list) do
    _sort(list)
  end

  defp _sort([a]), do: [a]

  defp _sort(list) do
    {a, b} = Enum.split(list, div(length(list),2))
    _merge([], _sort(a), _sort(b))
  end

  defp _merge(left, [], []), do: left
  defp _merge(left, [], b), do: _merge(left ++ [hd(b)], [], tl(b))
  defp _merge(left, a, []), do: _merge(left ++ [hd(a)], tl(a), [])

  defp _merge(left, a, b) do
    if hd(a) < hd(b) do
      _merge(left ++ [hd(a)], tl(a), b)
    else
      _merge(left ++ [hd(b)], a, tl(b))
    end
  end
end
