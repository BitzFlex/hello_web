defmodule HelloWebWeb.Router do
  use HelloWebWeb, :router

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

  scope "/", HelloWebWeb do
    pipe_through :browser

    get "/", PageController, :index 
    get "/hello" , PageController, :hello
    get "/now" , PageController, :now
    get "/calc" , PageController, :calc
  end
end
