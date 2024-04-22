defmodule Rover.Point do
  def new(x, y) do
    {x, y}
  end

  def move({x, y}, :north) do
    {x, y + 1}
  end

  def move({x, y}, :south) do
    {x, y - 1}
  end

  def move({x, y}, :east) do
    {x + 1, y}
  end

  def move({x, y}, :west) do
    {x - 1, y}
  end

  def show(acc) do
    inspect(acc)
  end
end
