defmodule Unicycle.Associations.UnicycleAssociation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Unicycle.Associations.UnicycleAssociation


  schema "unicycle_associations" do
    field :country, :string
    field :hq, :string
    field :name, :string
    field :website, :string

    timestamps()
  end

  @doc false
  def changeset(%UnicycleAssociation{} = unicycle_association, attrs) do
    unicycle_association
    |> cast(attrs, [:name, :website, :hq, :country])
    |> validate_required([:name, :hq, :country])
  end
end
