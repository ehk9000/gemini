defmodule Inventory.WarehousingTest do
  use Inventory.DataCase

  alias Inventory.Warehousing

  describe "companies" do
    alias Inventory.Warehousing.Company

    import Inventory.WarehousingFixtures

    @invalid_attrs %{name: nil, tenant_id: nil}

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Warehousing.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Warehousing.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      valid_attrs = %{name: "some name", tenant_id: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %Company{} = company} = Warehousing.create_company(valid_attrs)
      assert company.name == "some name"
      assert company.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Warehousing.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      update_attrs = %{name: "some updated name", tenant_id: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %Company{} = company} = Warehousing.update_company(company, update_attrs)
      assert company.name == "some updated name"
      assert company.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Warehousing.update_company(company, @invalid_attrs)
      assert company == Warehousing.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Warehousing.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Warehousing.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Warehousing.change_company(company)
    end
  end

  describe "warehouses" do
    alias Inventory.Warehousing.Warhouse

    import Inventory.WarehousingFixtures

    @invalid_attrs %{address: nil, name: nil}

    test "list_warehouses/0 returns all warehouses" do
      warhouse = warhouse_fixture()
      assert Warehousing.list_warehouses() == [warhouse]
    end

    test "get_warhouse!/1 returns the warhouse with given id" do
      warhouse = warhouse_fixture()
      assert Warehousing.get_warhouse!(warhouse.id) == warhouse
    end

    test "create_warhouse/1 with valid data creates a warhouse" do
      valid_attrs = %{address: "some address", name: "some name"}

      assert {:ok, %Warhouse{} = warhouse} = Warehousing.create_warhouse(valid_attrs)
      assert warhouse.address == "some address"
      assert warhouse.name == "some name"
    end

    test "create_warhouse/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Warehousing.create_warhouse(@invalid_attrs)
    end

    test "update_warhouse/2 with valid data updates the warhouse" do
      warhouse = warhouse_fixture()
      update_attrs = %{address: "some updated address", name: "some updated name"}

      assert {:ok, %Warhouse{} = warhouse} = Warehousing.update_warhouse(warhouse, update_attrs)
      assert warhouse.address == "some updated address"
      assert warhouse.name == "some updated name"
    end

    test "update_warhouse/2 with invalid data returns error changeset" do
      warhouse = warhouse_fixture()
      assert {:error, %Ecto.Changeset{}} = Warehousing.update_warhouse(warhouse, @invalid_attrs)
      assert warhouse == Warehousing.get_warhouse!(warhouse.id)
    end

    test "delete_warhouse/1 deletes the warhouse" do
      warhouse = warhouse_fixture()
      assert {:ok, %Warhouse{}} = Warehousing.delete_warhouse(warhouse)
      assert_raise Ecto.NoResultsError, fn -> Warehousing.get_warhouse!(warhouse.id) end
    end

    test "change_warhouse/1 returns a warhouse changeset" do
      warhouse = warhouse_fixture()
      assert %Ecto.Changeset{} = Warehousing.change_warhouse(warhouse)
    end
  end

  describe "item" do
    alias Inventory.Warehousing.Item

    import Inventory.WarehousingFixtures

    @invalid_attrs %{description: nil, name: nil, sku: nil, unit: nil, weight: nil}

    test "list_item/0 returns all item" do
      item = item_fixture()
      assert Warehousing.list_item() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Warehousing.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{description: "some description", name: "some name", sku: "some sku", unit: "some unit", weight: 42}

      assert {:ok, %Item{} = item} = Warehousing.create_item(valid_attrs)
      assert item.description == "some description"
      assert item.name == "some name"
      assert item.sku == "some sku"
      assert item.unit == "some unit"
      assert item.weight == 42
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Warehousing.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", sku: "some updated sku", unit: "some updated unit", weight: 43}

      assert {:ok, %Item{} = item} = Warehousing.update_item(item, update_attrs)
      assert item.description == "some updated description"
      assert item.name == "some updated name"
      assert item.sku == "some updated sku"
      assert item.unit == "some updated unit"
      assert item.weight == 43
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Warehousing.update_item(item, @invalid_attrs)
      assert item == Warehousing.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Warehousing.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Warehousing.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Warehousing.change_item(item)
    end
  end
end
