defmodule Rover.Point do
  def new(x, y) do
    {x, y}
  end

  def new, do: {0, 0}

  def move({x, y}, heading) do
    case heading do
      :north -> {x, y - 1}
      :south -> {x, y + 1}
      :east -> {x + 1, y}
      :west -> {x - 1, y}
    end
  end

  def show(acc) do
    inspect(acc)
  end
end
