defmodule Unicycle.Meetup.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias Unicycle.Meetup.Event


  schema "events" do
    field :description, :string
    field :from_date, :date
    field :location, :string
    field :title, :string
    field :to_date, :date

    timestamps()
  end

  @doc false
  def changeset(%Event{} = event, attrs) do
    event
    |> cast(attrs, [:title, :description, :from_date, :to_date, :location])
    |> validate_required([:title, :from_date, :location])
  end
end
