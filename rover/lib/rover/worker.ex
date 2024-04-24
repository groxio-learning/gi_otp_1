defmodule Rover.Worker do
  use GenServer

  alias Rover.Robot

  # client

  def start_link(_input) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_elements) do
    initial_state = Robot.new()
    {:ok, initial_state}
  end

  @impl true
  def handle_cast(:forward, robot) do
    new_state = Robot.forward(robot)
    {:noreply, new_state}
  end

  @impl true
  def handle_cast(:left, robot) do
    new_state = Robot.left(robot)
    {:noreply, new_state}
  end

  @impl true
  def handle_cast(:right, robot) do
    new_state = Robot.right(robot)
    {:noreply, new_state}
  end

  @impl true
  def handle_call(:show, _from, robot) do
    {:reply, robot, robot}
  end

  def forward(pid) do
    GenServer.cast(pid, :forward)
  end

  def left(pid) do
    GenServer.cast(pid, :left)
  end

  def right(pid) do
    GenServer.cast(pid, :right)
  end

  def show(pid) do
    GenServer.call(pid, :show)
  end

end
