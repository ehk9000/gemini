defmodule Inventory.Warehousing.Item do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "item" do
    field :description, :string
    field :name, :string
    field :sku, :string
    field :unit, :string
    field :weight, :integer

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:sku, :name, :description, :weight, :unit])
    |> validate_required([:sku, :name, :description, :weight, :unit])
  end
end
