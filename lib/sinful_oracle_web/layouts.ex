defmodule SinfulOracleWeb.Layouts do
  use Phoenix.Component

  def root(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="theme-color" content="#100b13" />
        <title>Sinful Oracle — Confess your desires</title>
        <link phx-track-static rel="stylesheet" href="/assets/app.css" />
      </head>
      <body>
        {@inner_content}
      </body>
    </html>
    """
  end
end
