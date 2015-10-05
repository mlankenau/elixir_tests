defmodule MergeSortTest do
  use ExUnit.Case
  doctest MergeSort

  test "sort numbers with merge sort" do
    assert MergeSort.sort([5,2,1,13,17,5,2]) == [1,2,2,5,5,13,17]
  end
end
