defmodule Unicycle.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :description, :text
      add :from_date, :date
      add :to_date, :date
      add :location, :string

      timestamps()
    end

  end
end
