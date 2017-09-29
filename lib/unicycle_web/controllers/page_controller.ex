defmodule UnicycleWeb.PageController do
  use UnicycleWeb, :controller
  alias Unicycle.{Meetup, Albums}

  def index(conn, _params) do
    render conn, "index.html"
  end

  def events(conn, _params) do
    events = Meetup.list_events()
    render(conn, "events.html", events: events)
  end

  def show_event(conn, %{"id": id}) do
  	event = Meetup.get_event!(id)
  	render(conn, "event_details.html", event: event)
  end

  def images(conn, _params) do
    images = Albums.list_images()
    render(conn, "images.html", images: images)
  end

  def videos(conn, _params) do
    videos = Albums.list_videos()
    render(conn, "videos.html", videos: videos)
  end

  def dashboard(conn, _params) do
  	conn
    |> put_layout("admin.html")
    |> render("dashboard.html")
  end
end
