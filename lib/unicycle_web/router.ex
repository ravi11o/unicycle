defmodule UnicycleWeb.Router do
  use UnicycleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UnicycleWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/events", EventController
    resources "/videos", VideoController
    resources "/images", ImageController
  end

  scope "/podies-admin", UnicycleWeb do
    pipe_through :browser

    get "/", SessionController, :new
    post "/", SessionController, :login
  end

  # Other scopes may use custom stacks.
  # scope "/api", UnicycleWeb do
  #   pipe_through :api
  # end
end
