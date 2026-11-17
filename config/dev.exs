import Config

config :sinful_oracle, SinfulOracleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: String.duplicate("development-secret-key-", 4),
  watchers: []

config :logger, :console, format: "[$level] $message\n"
