use Mix.Config

# Configure your database
config :phoenix_live_view_starter_app, PhoenixLiveViewStarterApp.Repo,
  username: "root",
  password: "",
  database: "phoenix_live_view_starter_app_test",
  hostname: "db",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_live_view_starter_app_web, PhoenixLiveViewStarterAppWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
