defmodule PhoenixLiveViewStarterAppWeb.PageLive do
  use Phoenix.LiveView

  def render(assigns) do
    PhoenixLiveViewStarterAppWeb.PageLiveView.render("index.html", assigns)
  end

  def mount(%{page_index_path: page_index_path, thing_index_path: thing_index_path}, socket) do
    {
      :ok,
      assign(
        socket,
        page_index_path: page_index_path,
        thing_index_path: thing_index_path,
        thing: "1"
      )
    }
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
