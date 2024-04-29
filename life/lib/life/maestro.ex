defmodule Life.Maestro do
  use GenServer

  alias Life.Worker

  @impl true
  def init(names) do
    send(self(), :tick)
    {:ok, names}
  end

  @impl true
  def handle_info(:tick, names) do
    :timer.send_after(500, :tick)

    names
    |> Enum.each(
      fn name ->
        Worker.evolve_get(name)
        |> IO.puts()
      end
    )

    IO.puts("")
    IO.puts("")

    {:noreply, names}
  end

  @impl true
  def start_link(names) do
    GenServer.start_link(__MODULE__, names, name: :maestro)
  end

end
