defmodule Life.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Life.Worker.start_link(arg)
      %{id: :batman, start: {Life.Worker, :start_link, [:batman]}},
      %{id: :ironman, start: {Life.Worker, :start_link, [:ironman]}},
      {Life.Maestro, ~W[batman ironman]a}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Life.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
