defmodule UnicycleWeb.Plugs.LoggedAdmin do

  import Plug.Conn
  alias Unicycle.Accounts

  def init(_params) do
  end

  def call(conn, _params) do
    admin_id = get_session(conn, :admin_id)

    if admin = admin_id && Accounts.get_admin(admin_id) do
      conn
      |> assign(:admin, admin)
    else
      conn
      |> assign(:admin, nil)
    end
  end
end