defmodule PhoenixLiveViewStarterAppWeb.Router do
  use PhoenixLiveViewStarterAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixLiveViewStarterAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/page-live", PageLiveController, :index

    resources "/things", ThingController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixLiveViewStarterAppWeb do
  #   pipe_through :api
  # end
end
