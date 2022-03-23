# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chat_with_phoenix_http_websockets,
  ecto_repos: [ChatWithPhoenixHttpWebsockets.Repo]

# Configures the endpoint
config :chat_with_phoenix_http_websockets, ChatWithPhoenixHttpWebsocketsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "clL9pkzm5MUx/L2EoJKrxTsFDwhBVb27hC1Vza0g9KvxxRhoo7p+u0nDQeLCFhlQ",
  render_errors: [view: ChatWithPhoenixHttpWebsocketsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ChatWithPhoenixHttpWebsockets.PubSub,
  live_view: [signing_salt: "CmM0Qvf3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
