defmodule Grokking.Sort do
  @moduledoc """
  A module implementing various sorting algorithms
  """

  @spec selection([any]) :: [any]
  def selection(list), do: selection(list, [])

  defp selection([], sorted_list), do: sorted_list

  defp selection(list, sorted_list) do
    {value, index} = max_value_and_index(list)
    selection(List.delete_at(list, index), [value | sorted_list])
  end

  defp max_value_and_index(list) do
    list
    |> Stream.with_index
    |> Enum.max_by(fn {value, index} -> value end)
  end
end
