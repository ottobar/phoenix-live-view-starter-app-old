defmodule PhoenixLivePageStarterApp.ThingamabobbersTest do
  use PhoenixLivePageStarterApp.DataCase

  alias PhoenixLivePageStarterApp.Thingamabobbers

  describe "things" do
    alias PhoenixLivePageStarterApp.Thingamabobbers.Thing

    @valid_attrs %{amount: "120.5", data: %{}, description: "some description", event: ~N[2010-04-17 14:00:00], flag: true, name: "some name", number: 42}
    @update_attrs %{amount: "456.7", data: %{}, description: "some updated description", event: ~N[2011-05-18 15:01:01], flag: false, name: "some updated name", number: 43}
    @invalid_attrs %{amount: nil, data: nil, description: nil, event: nil, flag: nil, name: nil, number: nil}

    def thing_fixture(attrs \\ %{}) do
      {:ok, thing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Thingamabobbers.create_thing()

      thing
    end

    test "list_things/0 returns all things" do
      thing = thing_fixture()
      assert Thingamabobbers.list_things() == [thing]
    end

    test "get_thing!/1 returns the thing with given id" do
      thing = thing_fixture()
      assert Thingamabobbers.get_thing!(thing.id) == thing
    end

    test "create_thing/1 with valid data creates a thing" do
      assert {:ok, %Thing{} = thing} = Thingamabobbers.create_thing(@valid_attrs)
      assert thing.amount == Decimal.new("120.5")
      assert thing.data == %{}
      assert thing.description == "some description"
      assert thing.event == ~N[2010-04-17 14:00:00]
      assert thing.flag == true
      assert thing.name == "some name"
      assert thing.number == 42
    end

    test "create_thing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Thingamabobbers.create_thing(@invalid_attrs)
    end

    test "update_thing/2 with valid data updates the thing" do
      thing = thing_fixture()
      assert {:ok, %Thing{} = thing} = Thingamabobbers.update_thing(thing, @update_attrs)
      assert thing.amount == Decimal.new("456.7")
      assert thing.data == %{}
      assert thing.description == "some updated description"
      assert thing.event == ~N[2011-05-18 15:01:01]
      assert thing.flag == false
      assert thing.name == "some updated name"
      assert thing.number == 43
    end

    test "update_thing/2 with invalid data returns error changeset" do
      thing = thing_fixture()
      assert {:error, %Ecto.Changeset{}} = Thingamabobbers.update_thing(thing, @invalid_attrs)
      assert thing == Thingamabobbers.get_thing!(thing.id)
    end

    test "delete_thing/1 deletes the thing" do
      thing = thing_fixture()
      assert {:ok, %Thing{}} = Thingamabobbers.delete_thing(thing)
      assert_raise Ecto.NoResultsError, fn -> Thingamabobbers.get_thing!(thing.id) end
    end

    test "change_thing/1 returns a thing changeset" do
      thing = thing_fixture()
      assert %Ecto.Changeset{} = Thingamabobbers.change_thing(thing)
    end
  end
end
