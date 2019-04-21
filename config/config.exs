# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :sinergy_demo, SinergyDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yBiYBf9Uh0aMutQ9YN18qugiWkQ8l/yR+dp19UBhwhgjuXH1MwJCM0ixAGa8AUF2",
  render_errors: [view: SinergyDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SinergyDemo.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
