defmodule Inventory.Warehousing.Company do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  @foreign_key_type :binary_id
  schema "companies" do
    field :tenant_id, Ecto.UUID, primary_key: true
    field :company_id, Ecto.UUID, autogenerate: true, primary_key: true
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :tenant_id])
    |> validate_required([:name, :tenant_id])
  end
end
