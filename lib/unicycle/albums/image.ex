defmodule Unicycle.Albums.Image do
  use Ecto.Schema
  import Ecto.Changeset
  alias Unicycle.Albums.Image


  schema "images" do
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(%Image{} = image, attrs) do
    image
    |> cast(attrs, [:title, :url])
    |> validate_required([:title, :url])
  end
end
