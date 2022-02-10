defmodule InventoryWeb.ErrorView do
  use InventoryWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def render("missing_tenant_id.json", _) do
    %{
      errors: [
        %{
          title: "Tenant ID Not Set",
          message: "The tenant-id header must be sent with the request"
        }
      ]
    }
  end
end
