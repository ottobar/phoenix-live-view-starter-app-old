defmodule PhoenixLivePageStarterAppWeb.PageController do
  use PhoenixLivePageStarterAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
