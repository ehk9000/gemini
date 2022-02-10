defmodule Inventory.Repo.Migrations.CreateWarehouses do
  use Ecto.Migration

  def change do
    create table(:warehouses, primary_key: false) do
      add :warehouse_id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :address, :string, null: false
      add :tenant_id, :uuid, primary_key: true

      add :company_id,
          references(:companies,
            column: :company_id,
            type: :uuid,
            with: [tenant_id: :tenant_id]
          ),
          null: false

      timestamps()
    end
  end
end
