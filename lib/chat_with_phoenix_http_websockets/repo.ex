defmodule ChatWithPhoenixHttpWebsockets.Repo do
  use Ecto.Repo,
    otp_app: :chat_with_phoenix_http_websockets,
    adapter: Ecto.Adapters.Postgres
end
