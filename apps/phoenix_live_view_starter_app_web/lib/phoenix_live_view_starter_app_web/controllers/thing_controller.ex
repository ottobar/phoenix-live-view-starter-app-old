defmodule PhoenixLiveViewStarterAppWeb.ThingController do
  use PhoenixLiveViewStarterAppWeb, :controller

  alias PhoenixLiveViewStarterApp.Thingamabobbers
  alias PhoenixLiveViewStarterApp.Thingamabobbers.Thing

  def index(conn, _params) do
    things = Thingamabobbers.list_things()
    render(conn, "index.html", things: things)
  end

  def new(conn, _params) do
    changeset = Thingamabobbers.change_thing(%Thing{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"thing" => thing_params}) do
    case Thingamabobbers.create_thing(thing_params) do
      {:ok, thing} ->
        conn
        |> put_flash(:info, "Thing created successfully.")
        |> redirect(to: Routes.thing_path(conn, :show, thing))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    thing = Thingamabobbers.get_thing!(id)
    render(conn, "show.html", thing: thing)
  end

  def edit(conn, %{"id" => id}) do
    thing = Thingamabobbers.get_thing!(id)
    changeset = Thingamabobbers.change_thing(thing)
    render(conn, "edit.html", thing: thing, changeset: changeset)
  end

  def update(conn, %{"id" => id, "thing" => thing_params}) do
    thing = Thingamabobbers.get_thing!(id)

    case Thingamabobbers.update_thing(thing, thing_params) do
      {:ok, thing} ->
        conn
        |> put_flash(:info, "Thing updated successfully.")
        |> redirect(to: Routes.thing_path(conn, :show, thing))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", thing: thing, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    thing = Thingamabobbers.get_thing!(id)
    {:ok, _thing} = Thingamabobbers.delete_thing(thing)

    conn
    |> put_flash(:info, "Thing deleted successfully.")
    |> redirect(to: Routes.thing_path(conn, :index))
  end
end
