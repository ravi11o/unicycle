defmodule Unicycle.Associations do
  @moduledoc """
  The Associations context.
  """

  import Ecto.Query, warn: false
  alias Unicycle.Repo

  alias Unicycle.Associations.UnicycleAssociation

  @doc """
  Returns the list of unicycle_associations.

  ## Examples

      iex> list_unicycle_associations()
      [%UnicycleAssociation{}, ...]

  """
  def list_unicycle_associations do
    Repo.all(UnicycleAssociation)
  end

  @doc """
  Gets a single unicycle_association.

  Raises `Ecto.NoResultsError` if the Unicycle association does not exist.

  ## Examples

      iex> get_unicycle_association!(123)
      %UnicycleAssociation{}

      iex> get_unicycle_association!(456)
      ** (Ecto.NoResultsError)

  """
  def get_unicycle_association!(id), do: Repo.get!(UnicycleAssociation, id)

  @doc """
  Creates a unicycle_association.

  ## Examples

      iex> create_unicycle_association(%{field: value})
      {:ok, %UnicycleAssociation{}}

      iex> create_unicycle_association(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_unicycle_association(attrs \\ %{}) do
    %UnicycleAssociation{}
    |> UnicycleAssociation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a unicycle_association.

  ## Examples

      iex> update_unicycle_association(unicycle_association, %{field: new_value})
      {:ok, %UnicycleAssociation{}}

      iex> update_unicycle_association(unicycle_association, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_unicycle_association(%UnicycleAssociation{} = unicycle_association, attrs) do
    unicycle_association
    |> UnicycleAssociation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UnicycleAssociation.

  ## Examples

      iex> delete_unicycle_association(unicycle_association)
      {:ok, %UnicycleAssociation{}}

      iex> delete_unicycle_association(unicycle_association)
      {:error, %Ecto.Changeset{}}

  """
  def delete_unicycle_association(%UnicycleAssociation{} = unicycle_association) do
    Repo.delete(unicycle_association)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking unicycle_association changes.

  ## Examples

      iex> change_unicycle_association(unicycle_association)
      %Ecto.Changeset{source: %UnicycleAssociation{}}

  """
  def change_unicycle_association(%UnicycleAssociation{} = unicycle_association) do
    UnicycleAssociation.changeset(unicycle_association, %{})
  end
end
