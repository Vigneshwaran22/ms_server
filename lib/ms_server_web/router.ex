defmodule MsServerWeb.Router do
  use MsServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug(CORSPlug, origin: "*")
  end

  scope "/api", MsServerWeb do
    pipe_through :api

    scope "/v1" do
      get "/recipes", RecipeController, :index
      get "/recipes/:id", RecipeController, :show
    end
  end
end
