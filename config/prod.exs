import Config

config :sinful_oracle, SinfulOracleWeb.Endpoint,
  server: true,
  http: [ip: {0, 0, 0, 0}, port: {:system, "PORT"}],
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE")
