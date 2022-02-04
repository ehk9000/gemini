defmodule Inventory.Warehousing.Item do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  @foreign_key_type :binary_id
  schema "items" do
    field :item_id, Ecto.UUID, primary_key: true
    field :tenant_id, Ecto.UUID, primary_key: true
    field :description, :string
    field :name, :string
    field :sku, :string
    field :unit, :string
    field :weight, :integer
    belongs_to :company_id, Inventory.Warehousing.Company, references: :company_id
    belongs_to :warehouse_id, Inventory.Warehousing.Warehouse, references: :warehouse_id

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:sku, :name, :description, :weight, :unit])
    |> validate_required([:sku, :name, :description, :weight, :unit])
  end
end
