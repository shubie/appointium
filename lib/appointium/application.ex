defmodule Appointium.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Appointium.Repo,
      # Start the Telemetry supervisor
      AppointiumWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Appointium.PubSub},
      # Start the Endpoint (http/https)
      AppointiumWeb.Endpoint
      # Start a worker by calling: Appointium.Worker.start_link(arg)
      # {Appointium.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Appointium.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AppointiumWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
