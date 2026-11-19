
defmodule SinfulOracleWeb.Layouts do
  use Phoenix.Component

  import Phoenix.Controller, only: [get_csrf_token: 0]

  def root(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="theme-color" content="#100b13" />
        <meta name="csrf-token" content={get_csrf_token()} />

        <title>Sinful Oracle — Confess your desires</title>

        <link
          phx-track-static
          rel="stylesheet"
          href="/assets/app.css"
        />

        <script
          defer
          src="https://cdn.jsdelivr.net/npm/phoenix@1.7.21/priv/static/phoenix.min.js">
        </script>

        <script
          defer
          src="https://cdn.jsdelivr.net/npm/phoenix_live_view@1.0.17/priv/static/phoenix_live_view.min.js">
        </script>

        <script
          defer
          phx-track-static
          src="/assets/app.js">
        </script>
      </head>

      <body>
        {@inner_content}
      </body>
    </html>
    """
  end
end
