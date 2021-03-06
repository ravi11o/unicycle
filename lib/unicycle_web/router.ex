defmodule UnicycleWeb.Router do
  use UnicycleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug UnicycleWeb.Plugs.LoggedAdmin
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin do
    plug UnicycleWeb.Plugs.AuthenticateAdmin
    plug :put_layout, {UnicycleWeb.LayoutView, :admin}
  end
 
  scope "/", UnicycleWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/events", PageController, :events
    get "/events/:id", PageController, :show_event
    get "/images", PageController, :images
    get "/videos", PageController, :videos
    
  end

  scope "/podies-admin", UnicycleWeb do
    pipe_through :browser

    get "/", SessionController, :new
    post "/", SessionController, :login
    
    scope "/" do
    pipe_through :admin

      get "/dashboard", PageController, :dashboard
      resources "/events", EventController
      resources "/videos", VideoController
      resources "/images", ImageController
      resources "/unicycle_associations", UnicycleAssociationController

    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", UnicycleWeb do
  #   pipe_through :api
  # end
end
