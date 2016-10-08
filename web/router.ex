defmodule Asciinema.Router do
  use Asciinema.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Asciinema.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Asciinema do
    pipe_through :browser # Use the default browser stack

    get "/docs", DocController, :index
    get "/docs/:topic", DocController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Asciinema do
  #   pipe_through :api
  # end
end
