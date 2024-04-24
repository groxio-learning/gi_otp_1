defmodule Rover.Robot do
  defstruct point: {0, 0}, orientation: :north, history: []
  alias Rover.Point
  @clockwise ~w{north east south west north}a
  @counterclockwise Enum.reverse(@clockwise)

  def new() do
    %__MODULE__{}
  end

  # To add 3 new fn -> left, right and forward with argument (acc-> robot)
  # robot it's like a pointer in C

  def save_history(robot) do
    %{robot | history: [robot.point | robot.history]}
  end

  def show_history(robot) do
    robot.history
  end

  def export_history(robot) do
    File.write!(
      "store.txt",
      inspect(robot.history)
    )
  end

  def forward(robot) do
    robot = save_history(robot)
    %{robot | point: Point.move(robot.point, robot.orientation)}
  end

  def turn(robot, compass) do
    dir =
      compass
      |> Enum.reverse()
      |> Enum.drop_while(fn d -> d != robot.orientation end)
      |> Enum.drop(1)
      |> hd()

    %{robot | orientation: dir}

  end

  def left(robot) do
    turn(robot, @clockwise)
  end

  def right(robot) do
    turn(robot, @counterclockwise)
  end

  def move(robot, :left) do
    left(robot)
  end

  def move(robot, :right) do
    right(robot)
  end

  def move(robot, :forward) do
    forward(robot)
  end

  def all(robot, moves) do
    Enum.reduce(moves, robot, fn move, acc ->
      move(acc, move)
    end)
  end
end
