
defmodule SinfulOracleWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :sinful_oracle

  @session_options [
    store: :cookie,
    key: "_sinful_oracle_key",
    signing_salt: "sinful-oracle-session"
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]],
    longpoll: [connect_info: [session: @session_options]]

  plug Plug.Static,
    at: "/",
    from: :sinful_oracle,
    gzip: false,
    only: ~w(assets favicon.ico robots.txt)

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Jason

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug SinfulOracleWeb.Router
end
