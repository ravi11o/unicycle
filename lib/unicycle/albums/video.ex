defmodule Unicycle.Albums.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Unicycle.Albums.Video


  schema "videos" do
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [:title, :url])
    |> validate_required([:title, :url])
  end
end
