defmodule Unicycle.Accounts do

alias Unicycle.Accounts.Admin
alias Unicycle.Repo

# User details

  def get_admin_by_username(username) do
    Repo.get_by(Admin, username: username)
  end


end