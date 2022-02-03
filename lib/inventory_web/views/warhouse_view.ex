defmodule InventoryWeb.WarhouseView do
  use InventoryWeb, :view
  alias InventoryWeb.WarhouseView

  def render("index.json", %{warehouses: warehouses}) do
    %{data: render_many(warehouses, WarhouseView, "warhouse.json")}
  end

  def render("show.json", %{warhouse: warhouse}) do
    %{data: render_one(warhouse, WarhouseView, "warhouse.json")}
  end

  def render("warhouse.json", %{warhouse: warhouse}) do
    %{
      id: warhouse.id,
      name: warhouse.name,
      address: warhouse.address
    }
  end
end
