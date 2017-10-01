defmodule Unicycle.AssociationsTest do
  use Unicycle.DataCase

  alias Unicycle.Associations

  describe "unicycle_associations" do
    alias Unicycle.Associations.UnicycleAssociation

    @valid_attrs %{country: "some country", hq: "some hq", name: "some name", website: "some website"}
    @update_attrs %{country: "some updated country", hq: "some updated hq", name: "some updated name", website: "some updated website"}
    @invalid_attrs %{country: nil, hq: nil, name: nil, website: nil}

    def unicycle_association_fixture(attrs \\ %{}) do
      {:ok, unicycle_association} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Associations.create_unicycle_association()

      unicycle_association
    end

    test "list_unicycle_associations/0 returns all unicycle_associations" do
      unicycle_association = unicycle_association_fixture()
      assert Associations.list_unicycle_associations() == [unicycle_association]
    end

    test "get_unicycle_association!/1 returns the unicycle_association with given id" do
      unicycle_association = unicycle_association_fixture()
      assert Associations.get_unicycle_association!(unicycle_association.id) == unicycle_association
    end

    test "create_unicycle_association/1 with valid data creates a unicycle_association" do
      assert {:ok, %UnicycleAssociation{} = unicycle_association} = Associations.create_unicycle_association(@valid_attrs)
      assert unicycle_association.country == "some country"
      assert unicycle_association.hq == "some hq"
      assert unicycle_association.name == "some name"
      assert unicycle_association.website == "some website"
    end

    test "create_unicycle_association/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Associations.create_unicycle_association(@invalid_attrs)
    end

    test "update_unicycle_association/2 with valid data updates the unicycle_association" do
      unicycle_association = unicycle_association_fixture()
      assert {:ok, unicycle_association} = Associations.update_unicycle_association(unicycle_association, @update_attrs)
      assert %UnicycleAssociation{} = unicycle_association
      assert unicycle_association.country == "some updated country"
      assert unicycle_association.hq == "some updated hq"
      assert unicycle_association.name == "some updated name"
      assert unicycle_association.website == "some updated website"
    end

    test "update_unicycle_association/2 with invalid data returns error changeset" do
      unicycle_association = unicycle_association_fixture()
      assert {:error, %Ecto.Changeset{}} = Associations.update_unicycle_association(unicycle_association, @invalid_attrs)
      assert unicycle_association == Associations.get_unicycle_association!(unicycle_association.id)
    end

    test "delete_unicycle_association/1 deletes the unicycle_association" do
      unicycle_association = unicycle_association_fixture()
      assert {:ok, %UnicycleAssociation{}} = Associations.delete_unicycle_association(unicycle_association)
      assert_raise Ecto.NoResultsError, fn -> Associations.get_unicycle_association!(unicycle_association.id) end
    end

    test "change_unicycle_association/1 returns a unicycle_association changeset" do
      unicycle_association = unicycle_association_fixture()
      assert %Ecto.Changeset{} = Associations.change_unicycle_association(unicycle_association)
    end
  end
end
