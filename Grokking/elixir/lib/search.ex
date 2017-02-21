defmodule Grokking.Search do
  @moduledoc """
  Sarch algorithms implemented in Elixir.
  """

  @spec binary([any], any) :: integer | nil
  def binary(list, value) do
    binary(List.to_tuple(list), value, 0, length(list) - 1)
  end

  defp binary(_tuple, _value, low, high) when low > high, do: nil

  defp binary(tuple, value, low, high) do
    mid = div(low + high, 2)
    mid_value = elem(tuple, mid)

    cond do
      mid_value == value ->
        mid
      mid_value > value ->
        binary(tuple, value, low, mid - 1)
      mid_value < value ->
        binary(tuple, value, mid + 1, high)
    end
  end
end
