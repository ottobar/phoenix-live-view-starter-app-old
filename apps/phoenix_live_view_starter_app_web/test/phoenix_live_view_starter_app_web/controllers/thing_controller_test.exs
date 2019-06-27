defmodule PhoenixLiveViewStarterAppWeb.ThingControllerTest do
  use PhoenixLiveViewStarterAppWeb.ConnCase

  alias PhoenixLiveViewStarterApp.Thingamabobbers

  @create_attrs %{amount: "120.5", data: %{}, description: "some description", event: ~N[2010-04-17 14:00:00], flag: true, name: "some name", number: 42}
  @update_attrs %{amount: "456.7", data: %{}, description: "some updated description", event: ~N[2011-05-18 15:01:01], flag: false, name: "some updated name", number: 43}
  @invalid_attrs %{amount: nil, data: nil, description: nil, event: nil, flag: nil, name: nil, number: nil}

  def fixture(:thing) do
    {:ok, thing} = Thingamabobbers.create_thing(@create_attrs)
    thing
  end

  describe "index" do
    test "lists all things", %{conn: conn} do
      conn = get(conn, Routes.thing_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Things"
    end
  end

  describe "new thing" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.thing_path(conn, :new))
      assert html_response(conn, 200) =~ "New Thing"
    end
  end

  describe "create thing" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.thing_path(conn, :create), thing: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.thing_path(conn, :show, id)

      conn = get(conn, Routes.thing_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Thing"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.thing_path(conn, :create), thing: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Thing"
    end
  end

  describe "edit thing" do
    setup [:create_thing]

    test "renders form for editing chosen thing", %{conn: conn, thing: thing} do
      conn = get(conn, Routes.thing_path(conn, :edit, thing))
      assert html_response(conn, 200) =~ "Edit Thing"
    end
  end

  describe "update thing" do
    setup [:create_thing]

    test "redirects when data is valid", %{conn: conn, thing: thing} do
      conn = put(conn, Routes.thing_path(conn, :update, thing), thing: @update_attrs)
      assert redirected_to(conn) == Routes.thing_path(conn, :show, thing)

      conn = get(conn, Routes.thing_path(conn, :show, thing))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, thing: thing} do
      conn = put(conn, Routes.thing_path(conn, :update, thing), thing: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Thing"
    end
  end

  describe "delete thing" do
    setup [:create_thing]

    test "deletes chosen thing", %{conn: conn, thing: thing} do
      conn = delete(conn, Routes.thing_path(conn, :delete, thing))
      assert redirected_to(conn) == Routes.thing_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.thing_path(conn, :show, thing))
      end
    end
  end

  defp create_thing(_) do
    thing = fixture(:thing)
    {:ok, thing: thing}
  end
end
