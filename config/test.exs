use Mix.Config

# Configure your database
config :phoenix_live_page_starter_app, PhoenixLivePageStarterApp.Repo,
  username: "root",
  password: "",
  database: "phoenix_live_page_starter_app_test",
  hostname: "db",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_live_page_starter_app_web, PhoenixLivePageStarterAppWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
