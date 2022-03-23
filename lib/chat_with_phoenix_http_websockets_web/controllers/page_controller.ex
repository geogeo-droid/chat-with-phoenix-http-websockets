defmodule ChatWithPhoenixHttpWebsocketsWeb.PageController do
  use ChatWithPhoenixHttpWebsocketsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
