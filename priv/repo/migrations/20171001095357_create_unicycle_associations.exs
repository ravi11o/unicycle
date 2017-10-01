defmodule Unicycle.Repo.Migrations.CreateUnicycleAssociations do
  use Ecto.Migration

  def change do
    create table(:unicycle_associations) do
      add :name, :string
      add :website, :string
      add :hq, :string
      add :country, :string

      timestamps()
    end

  end
end
