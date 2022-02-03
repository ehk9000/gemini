defmodule InventoryWeb.Router do
  use InventoryWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InventoryWeb do
    pipe_through :api

    get "/companies", CompanyController, :index
    get "/companies/:id", CompanyController, :show
    post "/companies", CompanyController, :create
    patch "/companies/:id", CompanyController, :update
    put "/companies/:id", CompanyController, :update
    delete "/companies/:id", CompanyController, :delete
  end

  scope "/api", InventoryWeb do
    pipe_through :api
  end
end
