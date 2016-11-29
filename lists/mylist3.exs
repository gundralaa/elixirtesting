defmodule SumList do
  def sum(list), do: _sum(list, 0)
  
  # Private methods that hide the function of the sum
  defp _sum([], total), do: total
  defp _sum([head | tail], total), do: _sum( tail, head+total )
end
