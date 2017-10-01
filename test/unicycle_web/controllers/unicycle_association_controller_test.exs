defmodule UnicycleWeb.UnicycleAssociationControllerTest do
  use UnicycleWeb.ConnCase

  alias Unicycle.Associations

  @create_attrs %{country: "some country", hq: "some hq", name: "some name", website: "some website"}
  @update_attrs %{country: "some updated country", hq: "some updated hq", name: "some updated name", website: "some updated website"}
  @invalid_attrs %{country: nil, hq: nil, name: nil, website: nil}

  def fixture(:unicycle_association) do
    {:ok, unicycle_association} = Associations.create_unicycle_association(@create_attrs)
    unicycle_association
  end

  describe "index" do
    test "lists all unicycle_associations", %{conn: conn} do
      conn = get conn, unicycle_association_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Unicycle associations"
    end
  end

  describe "new unicycle_association" do
    test "renders form", %{conn: conn} do
      conn = get conn, unicycle_association_path(conn, :new)
      assert html_response(conn, 200) =~ "New Unicycle association"
    end
  end

  describe "create unicycle_association" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, unicycle_association_path(conn, :create), unicycle_association: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == unicycle_association_path(conn, :show, id)

      conn = get conn, unicycle_association_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Unicycle association"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, unicycle_association_path(conn, :create), unicycle_association: @invalid_attrs
      assert html_response(conn, 200) =~ "New Unicycle association"
    end
  end

  describe "edit unicycle_association" do
    setup [:create_unicycle_association]

    test "renders form for editing chosen unicycle_association", %{conn: conn, unicycle_association: unicycle_association} do
      conn = get conn, unicycle_association_path(conn, :edit, unicycle_association)
      assert html_response(conn, 200) =~ "Edit Unicycle association"
    end
  end

  describe "update unicycle_association" do
    setup [:create_unicycle_association]

    test "redirects when data is valid", %{conn: conn, unicycle_association: unicycle_association} do
      conn = put conn, unicycle_association_path(conn, :update, unicycle_association), unicycle_association: @update_attrs
      assert redirected_to(conn) == unicycle_association_path(conn, :show, unicycle_association)

      conn = get conn, unicycle_association_path(conn, :show, unicycle_association)
      assert html_response(conn, 200) =~ "some updated country"
    end

    test "renders errors when data is invalid", %{conn: conn, unicycle_association: unicycle_association} do
      conn = put conn, unicycle_association_path(conn, :update, unicycle_association), unicycle_association: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Unicycle association"
    end
  end

  describe "delete unicycle_association" do
    setup [:create_unicycle_association]

    test "deletes chosen unicycle_association", %{conn: conn, unicycle_association: unicycle_association} do
      conn = delete conn, unicycle_association_path(conn, :delete, unicycle_association)
      assert redirected_to(conn) == unicycle_association_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, unicycle_association_path(conn, :show, unicycle_association)
      end
    end
  end

  defp create_unicycle_association(_) do
    unicycle_association = fixture(:unicycle_association)
    {:ok, unicycle_association: unicycle_association}
  end
end
