defmodule Inventory.Warehousing.Warhouse do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  @foreign_key_type :binary_id
  schema "warehouses" do
    field :id, Ecto.UUID, autogenerate: true, primary_key: true
    field :address, :string, :null
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(warhouse, attrs) do
    warhouse
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
  end
end
