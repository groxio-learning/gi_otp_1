defmodule Rover.Server do
  alias Rover.Robot

  # client

  def start_link(_input) do
    spawn_link(fn -> loop(Robot.new()) end)
  end

  def forward(pid) do
    send(pid, :forward)
  end

  def right(pid) do
    send(pid, :right)
  end

  def left(pid) do
    send(pid, :left)
  end

  def show(pid) do
    send(pid, {:show, self()})
    receive do
      robot -> robot
    end
  end

  # server

  def loop(robot) do
    robot
    |> listen()
    |> loop()
  end


  def listen(robot) do
    receive do
      :forward ->
        Robot.move(robot, :forward)
      :right ->
        Robot.move(robot, :right)
      :left ->
        Robot.move(robot, :left)
      {:show, from_pid} ->
        send(from_pid, robot)
        robot
    end
  end

end
