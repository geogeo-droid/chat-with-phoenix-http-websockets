use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :chat_with_phoenix_http_websockets, ChatWithPhoenixHttpWebsockets.Repo,
  username: "postgres",
  password: "password",
  database: "chat_with_phoenix_http_websockets_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chat_with_phoenix_http_websockets, ChatWithPhoenixHttpWebsocketsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
