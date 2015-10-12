defmodule MergeSortParallel do
  def sort(list) do
    _sort(list)
  end

  defp _sort([a]), do: [a]

  defp _sort(list) do
    {a, b} = Enum.split(list, div(length(list),2))
    task_a = Task.async(fn -> _sort(a) end)
    task_b = Task.async(fn -> _sort(b) end)
    _merge(Task.await(task_a), Task.await(task_b))
  end

  defp _merge([], []), do: []
  defp _merge([], b), do: b
  defp _merge(a, []), do: a

  defp _merge(a, b) do
    if hd(a) < hd(b) do
      [hd(a) | _merge(tl(a), b)]
    else
      [hd(b) | _merge(a, tl(b))]
    end
  end
end
