defmodule InventoryWeb.WarhouseController do
  use InventoryWeb, :controller

  alias Inventory.Warehousing
  alias Inventory.Warehousing.Warhouse

  action_fallback InventoryWeb.FallbackController

  def index(conn, _params) do
    warehouses = Warehousing.list_warehouses()
    render(conn, "index.json", warehouses: warehouses)
  end

  def create(conn, %{"warhouse" => warhouse_params}) do
    with {:ok, %Warhouse{} = warhouse} <- Warehousing.create_warhouse(warhouse_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.warhouse_path(conn, :show, warhouse))
      |> render("show.json", warhouse: warhouse)
    end
  end

  def show(conn, %{"id" => id}) do
    warhouse = Warehousing.get_warhouse!(id)
    render(conn, "show.json", warhouse: warhouse)
  end

  def update(conn, %{"id" => id, "warhouse" => warhouse_params}) do
    warhouse = Warehousing.get_warhouse!(id)

    with {:ok, %Warhouse{} = warhouse} <- Warehousing.update_warhouse(warhouse, warhouse_params) do
      render(conn, "show.json", warhouse: warhouse)
    end
  end

  def delete(conn, %{"id" => id}) do
    warhouse = Warehousing.get_warhouse!(id)

    with {:ok, %Warhouse{}} <- Warehousing.delete_warhouse(warhouse) do
      send_resp(conn, :no_content, "")
    end
  end
end
