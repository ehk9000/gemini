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
end
