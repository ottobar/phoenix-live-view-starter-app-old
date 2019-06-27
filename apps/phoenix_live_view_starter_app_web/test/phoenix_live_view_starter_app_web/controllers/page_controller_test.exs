defmodule PhoenixLiveViewStarterAppWeb.PageControllerTest do
  use PhoenixLiveViewStarterAppWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Hello, Phoenix Live View Starter App!"
  end
end
