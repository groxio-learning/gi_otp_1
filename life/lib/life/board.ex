defmodule Life.Board do
  alias Life.Cell

  @width 5
  @height 5

  def new() do
    for x <- (1..@width), y<- (1..@height), into: %{}, do: {{x,y}, Enum.random([true, false])}
  end

  def evolve(_board) do

  end

  def show(board) do
    for y <- (1..@height) do
      show_row(board, y) <> "\n"
    end
    |> Enum.join()
    #Enum.map(board, fn {_location, cell} -> Cell.show(cell) end)
  end

  defp show_row(board, row_number) do
    for x <- (1..@width) do
      Cell.show(Map.get(board, {x, row_number}, false))
    end
    |> Enum.join()
  end

end
