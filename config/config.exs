# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :phoenix_live_page_starter_app,
  ecto_repos: [PhoenixLivePageStarterApp.Repo]

config :phoenix_live_page_starter_app_web,
  ecto_repos: [PhoenixLivePageStarterApp.Repo],
  generators: [context_app: :phoenix_live_page_starter_app]

# Configures the endpoint
config :phoenix_live_page_starter_app_web, PhoenixLivePageStarterAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wkfuo9Zlqp9V/Q3sl2gHkRz+4bNYmGhxXuMXAo+qy2euif7oepIyCYGvlGKXWOpw",
  render_errors: [view: PhoenixLivePageStarterAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixLivePageStarterAppWeb.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "yg6VmECGZezwXdnmy+Z8GhRUSXg/r+L4"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix,
  json_library: Jason,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
