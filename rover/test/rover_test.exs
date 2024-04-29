defmodule RoverTest do
  use ExUnit.Case
  doctest Rover
  alias Rover.Robot

  test "greets the world" do
    assert Rover.hello() == :world
  end

  test "initialize rover" do
    robot = Robot.new()
    assert robot.point == {0, 0}
  end

  test "move rover" do
    robot =
      Robot.new()
      |> Robot.forward()

    assert robot.point == {0, -1}
  end

  test "save history on initialization" do
    robot = Robot.new()
    assert robot.history == []
  end

  test "save history" do
    robot = Robot.new()
         |> Robot.forward()

    assert robot.history == [
             {0, 0}
           ]
  end

  test "move rover left" do
    robot =
      Robot.new()
      |> Robot.left()

    assert robot.orientation == :west
  end

  test "move rover right" do
    robot =
      Robot.new()
      |> Robot.right()

    assert robot.orientation == :east
  end
end
