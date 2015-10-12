defmodule RunLengthEncode do
  @doc ~S"""
    encode a list like [1, 2, 2, 2, 3, 4, 4]
    to [1, {2, 3}, 3, {4, 2}]
  """
  def encode(list) do
    _encode list
  end

  def _encode([a, b | tail]) when a == b do
    _encode([{a, 2}] ++ tail)
  end

  def _encode([{a, n}, b | tail]) when a == b do
    _encode([{a, n+1}] ++ tail)
  end

  def _encode([a | tail]) do
    [a] ++ _encode(tail)
  end

  def _encode([]) do
    []
  end
end

IO.inspect RunLengthEncode.encode([1, 2, 2, 2, 3, 4, 4])
