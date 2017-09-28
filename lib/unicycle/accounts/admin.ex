defmodule Unicycle.Accounts.Admin do
  use Ecto.Schema
  import Ecto.Changeset
  alias Unicycle.Accounts.Admin


  schema "admins" do
    field :password_hash, :string
    field :username, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%Admin{} = admin, attrs) do
    admin
    |> cast(attrs, [:username])
    |> validate_required([:username])
    |> unique_constraint(:username)
  end

  def registration_changeset(%Admin{} = admin, attrs) do
    admin
    |> changeset(attrs)
    |> cast(attrs, [:password])
    |> validate_required([:password])
    |> validate_length(:password, min: 4, max: 20)
    |> put_encrypted_pw
  end

  defp put_encrypted_pw(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ -> changeset 
    end
  end
end
