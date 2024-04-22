defmodule Rover do
  @moduledoc """
  Documentation for `Rover`.
  """

  alias Rover.Robot

  @doc """
  Hello world.

  ## Examples

      iex> Rover.hello()
      :world

  """
  def hello do
    :world
  end

  def move_rover do
    Robot.new()
    |> Robot.forward()
    |> Robot.left()
    |> Robot.forward()
    |> Robot.right()

  end

  def test do
    Robot.new()
    |> Robot.left()

  end

end
