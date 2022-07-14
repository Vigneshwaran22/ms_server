defmodule MsServer.Recipes do
  alias MsServer.ContentDeliveryApi

  def all() do
    %{"items" => recipes, "includes" => %{"Asset" => images}} = ContentDeliveryApi.entries()

    recipes
    |> Enum.map(fn %{
                     "sys" => %{"id" => id},
                     "fields" => %{"title" => title, "photo" => %{"sys" => %{"id" => photo_id}}}
                   } ->
      %{id: id, title: title, image: get_image_link(photo_id, images)}
    end)
  end

  def get(id) do
    %{"sys" => %{"id" => id}, "fields" => fields} = ContentDeliveryApi.entry(id)

    %{
      id: id,
      title: fields["title"],
      description: fields["description"],
      chef: get_entry(fields["chef"]),
      image: get_entry(fields["photo"]),
      tags: get_entry(fields["tags"])
    }
  end

  defp get_entry(nil), do: nil

  defp get_entry(entries) when is_list(entries),
    do: Enum.map(entries, fn entry -> get_entry(entry) end)

  defp get_entry(%{"sys" => %{"id" => id, "linkType" => link_type}}) do
    case link_type do
      "Asset" ->
        %{"fields" => %{"file" => %{"url" => url}}} = ContentDeliveryApi.entry(id, link_type)
        url

      "Entry" ->
        %{"fields" => %{"name" => name}} = ContentDeliveryApi.entry(id, link_type)
        name

      _ ->
        nil
    end
  end

  defp get_image_link(photo_id, photo_list) do
    %{"fields" => %{"file" => %{"url" => url}}} =
      Enum.find(photo_list, fn %{"sys" => %{"id" => id}} ->
        id == photo_id
      end)

    "https:#{url}"
  end
end
