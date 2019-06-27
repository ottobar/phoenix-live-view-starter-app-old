defmodule PhoenixLivePageStarterApp.Repo.Migrations.CreateThings do
  use Ecto.Migration

  def change do
    create table(:things) do
      add :name, :string
      add :description, :text
      add :data, :map
      add :number, :integer
      add :amount, :decimal
      add :flag, :boolean, default: false, null: false
      add :event, :naive_datetime

      timestamps()
    end

  end
end
