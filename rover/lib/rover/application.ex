defmodule Rover.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Rover.Worker.start_link(arg)
      %{id: :batman, start: {Rover.Worker, :start_link, [:batman]}},
      %{id: :ironman, start: {Rover.Worker, :start_link, [:ironman]}},
      %{id: :spiderman, start: {Rover.Worker, :start_link, [:spiderman]}},
      %{id: :spalman, start: {Rover.Worker, :start_link, [:spalman]}},
      %{id: :groot, start: {Rover.Worker, :start_link, [:groot]}},

    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: Rover.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
