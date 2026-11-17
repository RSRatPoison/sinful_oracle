import Config

config :sinful_oracle,
  generators: [timestamp_type: :utc_datetime]

config :sinful_oracle, SinfulOracleWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [html: SinfulOracleWeb.ErrorHTML],
    layout: false
  ],
  pubsub_server: SinfulOracle.PubSub,
  live_view: [signing_salt: "sinful-oracle-live-salt"]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
