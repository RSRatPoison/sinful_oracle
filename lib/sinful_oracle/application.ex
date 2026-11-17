defmodule SinfulOracle.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, name: SinfulOracle.PubSub},
      SinfulOracleWeb.Endpoint
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: SinfulOracle.Supervisor)
  end

  @impl true
  def config_change(changed, _new, removed) do
    SinfulOracleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
