defmodule Inventory.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:item, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :sku, :string
      add :name, :string
      add :description, :string
      add :weight, :integer
      add :unit, :string

      timestamps()
    end
  end
end
