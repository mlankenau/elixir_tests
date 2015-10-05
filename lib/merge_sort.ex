defmodule MergeSort do
  def sort(list) do
    _sort(list)
  end

  defp _sort([a]) do
    [a]
  end

  defp _sort(list) do
    {a, b} = Enum.split(list, div(length(list),2))
    a_sorted = _sort(a)
    b_sorted = _sort(b)
    _merge([], a_sorted, b_sorted)
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
