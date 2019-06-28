defmodule PhoenixLiveViewStarterAppWeb.ThingamabobberLive do
  use Phoenix.LiveView

  def render(assigns) do
    PhoenixLiveViewStarterAppWeb.ThingamabobberLiveView.render("thingamabobber.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, thing: "1")}
  end

  def handle_event("thingamabobber", _value, socket) do
    new_thing =
      case socket.assigns.thing do
        "1" -> "2"
        "2" -> "1"
      end

    {:noreply, assign(socket, thing: new_thing)}
  end
end
