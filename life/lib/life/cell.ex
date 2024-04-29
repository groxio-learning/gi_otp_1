defmodule Life.Cell do
  def show(true) do
    "[ * ]"
  end

  def show(false) do
    "[   ]"
  end

  def evolve(cell, neighbors) do
    cond do
      neighbors < 2 -> false
      neighbors > 3 -> false
      neighbors == 3 -> true
      neighbors == 2 -> cell
    end
  end
end
