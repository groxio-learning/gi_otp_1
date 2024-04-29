defmodule Life.Worker do
  use GenServer

  alias Life.Board

  # client

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  @impl true
  def init(name) do
    IO.inspect("Starting Game, #{name}")
    initial_state = Board.new()
    {:ok, initial_state}
  end


  @impl true
  def handle_call(:evolve, _from, board) do
    new_board = Board.evolve(board)
    {:reply, Board.show(new_board), new_board}
  end

  @impl true
  def handle_call(:show, _from, board) do
    string_result = Board.show(board)
    {:reply, string_result, board}
  end


  @impl true
  def handle_info(:tick, board) do
    new_board = Board.evolve(board)

    new_board
    |> Board.show()
    |> IO.puts()

    :timer.send_after(500, :tick)
    {:noreply, new_board}
  end


  def evolve(pid \\ :game)  do
    GenServer.call(pid, :evolve)
    |> IO.puts()
  end

  def show(pid) do
    GenServer.call(pid, :show)
    |> IO.puts
  end

end
