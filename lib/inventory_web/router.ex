defmodule InventoryWeb.Router do
  use InventoryWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InventoryWeb do
    pipe_through :api

    get "/", CompanyController, :index
  end

  scope "/api", InventoryWeb do
    pipe_through :api
  end
end
