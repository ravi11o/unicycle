defmodule UnicycleWeb.UnicycleAssociationController do
  use UnicycleWeb, :controller

  alias Unicycle.Associations
  alias Unicycle.Associations.UnicycleAssociation

  def index(conn, _params) do
    unicycle_associations = Associations.list_unicycle_associations()
    render(conn, "index.html", unicycle_associations: unicycle_associations)
  end

  def new(conn, _params) do
    changeset = Associations.change_unicycle_association(%UnicycleAssociation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"unicycle_association" => unicycle_association_params}) do
    case Associations.create_unicycle_association(unicycle_association_params) do
      {:ok, unicycle_association} ->
        conn
        |> put_flash(:info, "Unicycle association created successfully.")
        |> redirect(to: unicycle_association_path(conn, :show, unicycle_association))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    unicycle_association = Associations.get_unicycle_association!(id)
    render(conn, "show.html", unicycle_association: unicycle_association)
  end

  def edit(conn, %{"id" => id}) do
    unicycle_association = Associations.get_unicycle_association!(id)
    changeset = Associations.change_unicycle_association(unicycle_association)
    render(conn, "edit.html", unicycle_association: unicycle_association, changeset: changeset)
  end

  def update(conn, %{"id" => id, "unicycle_association" => unicycle_association_params}) do
    unicycle_association = Associations.get_unicycle_association!(id)

    case Associations.update_unicycle_association(unicycle_association, unicycle_association_params) do
      {:ok, unicycle_association} ->
        conn
        |> put_flash(:info, "Unicycle association updated successfully.")
        |> redirect(to: unicycle_association_path(conn, :show, unicycle_association))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", unicycle_association: unicycle_association, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    unicycle_association = Associations.get_unicycle_association!(id)
    {:ok, _unicycle_association} = Associations.delete_unicycle_association(unicycle_association)

    conn
    |> put_flash(:info, "Unicycle association deleted successfully.")
    |> redirect(to: unicycle_association_path(conn, :index))
  end
end
