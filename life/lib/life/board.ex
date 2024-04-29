defmodule Life.Board do
  alias Life.Cell

  @width 5
  @height 5

  def new() do
    for x <- 1..@width, y <- 1..@height, into: %{}, do: {{x, y}, Enum.random([true, false])}
  end

  def evolve(board) do
    for x <- 1..@width,
        y <- 1..@height,
        into: %{},
        do: {{x, y}, Cell.evolve(Map.get(board, {x, y}, false), neighbors(board, {x, y}))}
  end

  def neighbors(board, {x, y}) do
    for xx <- (x - 1)..(x + 1), yy <- (y - 1)..(y + 1), {xx, yy} != {x, y} do
      Map.get(board, {xx, yy}, false)
    end
    |> Enum.count(&Function.identity/1)

    # |> Enum.count(fn x -> x end)
  end

  def show(board) do
    for y <- 1..@height do
      show_row(board, y) <> "\n"
    end
    |> Enum.join()

    # Enum.map(board, fn {_location, cell} -> Cell.show(cell) end)
  end

  defp show_row(board, row_number) do
    for x <- 1..@width do
      Cell.show(Map.get(board, {x, row_number}, false))
    end
    |> Enum.join()
  end
end
