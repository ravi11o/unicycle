defmodule Unicycle.MeetupTest do
  use Unicycle.DataCase

  alias Unicycle.Meetup

  describe "events" do
    alias Unicycle.Meetup.Event

    @valid_attrs %{description: "some description", from_date: ~D[2010-04-17], location: "some location", title: "some title", to_date: ~D[2010-04-17]}
    @update_attrs %{description: "some updated description", from_date: ~D[2011-05-18], location: "some updated location", title: "some updated title", to_date: ~D[2011-05-18]}
    @invalid_attrs %{description: nil, from_date: nil, location: nil, title: nil, to_date: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Meetup.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Meetup.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Meetup.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Meetup.create_event(@valid_attrs)
      assert event.description == "some description"
      assert event.from_date == ~D[2010-04-17]
      assert event.location == "some location"
      assert event.title == "some title"
      assert event.to_date == ~D[2010-04-17]
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Meetup.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, event} = Meetup.update_event(event, @update_attrs)
      assert %Event{} = event
      assert event.description == "some updated description"
      assert event.from_date == ~D[2011-05-18]
      assert event.location == "some updated location"
      assert event.title == "some updated title"
      assert event.to_date == ~D[2011-05-18]
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Meetup.update_event(event, @invalid_attrs)
      assert event == Meetup.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Meetup.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Meetup.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Meetup.change_event(event)
    end
  end
end
