# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :ms_server, MsServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rBWhhw+Igac+PfAkCEgcch/d7oY/9ndGSF4w0siyERUFQNmrOCEjtzNQeOHujjvP",
  render_errors: [view: MsServerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: MsServer.PubSub,
  live_view: [signing_salt: "E5MNtYhT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ms_server,
  space_id: "kk2bw5ojx476",
  access_token: "7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c",
  environment: "master",
  cdapi_path: "https://cdn.contentful.com/spaces/"
