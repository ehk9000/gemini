defmodule Inventory.Warehousing.Warehouse do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  @foreign_key_type :binary_id
  schema "warehouses" do
    field :warehouse_id, Ecto.UUID, autogenerate: true, primary_key: true
    field :tenant_id, Ecto.UUID, primary_key: true
    field :address, :string
    field :name, :string
    belongs_to :company_id, Inventory.Warehousing.Company, references: :company_id

    timestamps()
  end

  @doc false
  def changeset(warehouse, attrs) do
    warehouse
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
  end
end
