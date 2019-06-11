defmodule PhoenixLivePageStarterAppWeb.LivePageController do
  use PhoenixLivePageStarterAppWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    LiveView.Controller.live_render(conn, PhoenixLivePageStarterAppWeb.PageLive, session: %{})
  end
end
