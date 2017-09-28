defmodule UnicycleWeb.SessionController do
  use UnicycleWeb, :controller
  import Comeonin.Bcrypt, only: [checkpw: 2]

  alias Unicycle.Accounts

  def new(conn, _params) do
    conn
    |> render("new.html")
  end

  def login(conn, %{"session" => %{"username" => username, "password" => pass}}) do
  	admin = Accounts.get_admin_by_username(username)

  	result = 
  	  cond do
  	  	admin && checkpw(pass, admin.password_hash) -> {:ok, conn}
  	  	admin -> {:error, :unauthorized, conn}
  	  	true -> {:error, :not_found, conn}
  	  end

  	case result do
  	  {:ok, conn} ->
  	    conn
  	    |> put_flash(:info, "login Successful")
  	    |> put_session(:admin_id, admin.id)
  	    |> redirect(to: page_path(conn, :index))
  	  {:error, _reason, conn} -> 
  	    conn
  	    |> put_flash(:error, "Invalid Username/Password Combination")
  	    |> redirect(to: session_path(conn, :new))
  	end
  end
end