import Config

config :sinful_oracle, SinfulOracleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  server: false,
  secret_key_base: String.duplicate("test-secret-key-", 8)

config :logger, level: :warning
