defmodule UnicycleWeb.Plugs.AuthenticateAdmin do

  use Phoenix.Controller
  alias UnicycleWeb.Router.Helpers, as: Routes
  

  def init(_params) do
  end

  def call(conn, _params) do
    if conn.assigns.admin do
      conn
    else 
      conn
      |> put_flash(:info, "Unauthorized")
      |> redirect(to: Routes.session_path(conn, :new))
    end
  end
end