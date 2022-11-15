defmodule MsServerWeb.RecipeView do
  use MsServerWeb, :view

  def render("recipe.json", %{recipe: recipe}) do
    %{
      id: recipe.id,
      title: recipe.title,
      description: recipe.description,
      image: recipe.image,
      chef: recipe.chef,
      tags: recipe.tags
    }
  end

  def render("list_recipe.json", %{recipe: recipe}) do
    %{
      id: recipe.id,
      title: recipe.title,
      image: recipe.image
    }
  end

  def render("index.json", %{recipes: recipes}) do
    render_many(recipes, __MODULE__, "list_recipe.json")
  end

  def render("show.json", %{recipe: recipe}) do
    render_one(recipe, __MODULE__, "recipe.json")
  end
end
