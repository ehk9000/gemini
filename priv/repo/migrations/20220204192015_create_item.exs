defmodule Inventory.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add :item_id, :binary_id, primary_key: true
      add :tenant_id, :uuid, primary_key: true
      add :sku, :string
      add :name, :string
      add :description, :string
      add :weight, :integer
      add :unit, :string
      add :company_id,
      references(:companies,
        column: :company_id,
        type: :uuid,
        with: [tenant_id: :tenant_id]
        ), null: false

      add :warehouse_id, references(:warehouses,
          column: :warehouse_id,
          type: :uuid,
          with: [tenant_id: :tenant_id]
        ), null: false

      timestamps()
    end
  end
end
