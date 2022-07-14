defmodule MsServerWeb.RecipeController do
  use MsServerWeb, :controller
  alias MsServer.Recipes

  def index(conn, _params) do
    render(conn, "index.json", %{recipes: Recipes.all()})
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.json", %{recipe: Recipes.get(id)})
  end
end
