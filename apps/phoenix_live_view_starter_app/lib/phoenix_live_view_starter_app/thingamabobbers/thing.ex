defmodule PhoenixLiveViewStarterApp.Thingamabobbers.Thing do
  use Ecto.Schema
  import Ecto.Changeset

  schema "things" do
    field :amount, :decimal
    field :data, :map, default: %{}
    field :description, :string
    field :event, :naive_datetime
    field :flag, :boolean, default: false
    field :name, :string
    field :number, :integer

    timestamps()
  end

  @doc false
  def changeset(thing, attrs) do
    thing
    |> cast(attrs, [:name, :description, :data, :number, :amount, :flag, :event])
    |> validate_required([:name, :description, :data, :number, :amount, :flag, :event])
  end
end
