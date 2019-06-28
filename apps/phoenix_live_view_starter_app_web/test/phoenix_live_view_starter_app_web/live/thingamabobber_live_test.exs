defmodule PhoenixLiveViewStarterAppWeb.ThingamabobberLiveTest do
  use PhoenixLiveViewStarterAppWeb.ConnCase
  import Phoenix.LiveViewTest
  alias PhoenixLiveViewStarterAppWeb.ThingamabobberLive

  test "thingamabobber button" do
    {:ok, view, _html} = mount(@endpoint, ThingamabobberLive)
    assert render(view) =~ "Thing 1"
    assert render_click(view, :thingamabobber) =~ "Thing 2"
    assert render_click(view, :thingamabobber) =~ "Thing 1"
    assert render_click(view, :thingamabobber) =~ "Thing 2"
  end
end
