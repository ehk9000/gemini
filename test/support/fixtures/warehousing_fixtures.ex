defmodule Inventory.WarehousingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Inventory.Warehousing` context.
  """

  @doc """
  Generate a company.
  """
  def company_fixture(attrs \\ %{}) do
    {:ok, company} =
      attrs
      |> Enum.into(%{
        name: "some name",
        tenant_id: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> Inventory.Warehousing.create_company()

    company
  end

  @doc """
  Generate a warhouse.
  """
  def warhouse_fixture(attrs \\ %{}) do
    {:ok, warhouse} =
      attrs
      |> Enum.into(%{
        address: "some address",
        name: "some name"
      })
      |> Inventory.Warehousing.create_warhouse()

    warhouse
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        sku: "some sku",
        unit: "some unit",
        weight: 42
      })
      |> Inventory.Warehousing.create_item()

    item
  end
end
