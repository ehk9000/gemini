defmodule InventoryWeb.WarhouseControllerTest do
  use InventoryWeb.ConnCase

  import Inventory.WarehousingFixtures

  alias Inventory.Warehousing.Warhouse

  @create_attrs %{
    address: "some address",
    name: "some name"
  }
  @update_attrs %{
    address: "some updated address",
    name: "some updated name"
  }
  @invalid_attrs %{address: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all warehouses", %{conn: conn} do
      conn = get(conn, Routes.warhouse_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create warhouse" do
    test "renders warhouse when data is valid", %{conn: conn} do
      conn = post(conn, Routes.warhouse_path(conn, :create), warhouse: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.warhouse_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some address",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.warhouse_path(conn, :create), warhouse: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update warhouse" do
    setup [:create_warhouse]

    test "renders warhouse when data is valid", %{conn: conn, warhouse: %Warhouse{id: id} = warhouse} do
      conn = put(conn, Routes.warhouse_path(conn, :update, warhouse), warhouse: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.warhouse_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, warhouse: warhouse} do
      conn = put(conn, Routes.warhouse_path(conn, :update, warhouse), warhouse: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete warhouse" do
    setup [:create_warhouse]

    test "deletes chosen warhouse", %{conn: conn, warhouse: warhouse} do
      conn = delete(conn, Routes.warhouse_path(conn, :delete, warhouse))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.warhouse_path(conn, :show, warhouse))
      end
    end
  end

  defp create_warhouse(_) do
    warhouse = warhouse_fixture()
    %{warhouse: warhouse}
  end
end
