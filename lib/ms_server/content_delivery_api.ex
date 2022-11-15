defmodule MsServer.ContentDeliveryApi do
  def entries do
    HTTPoison.start()

    case HTTPoison.get(
           "#{Application.get_env(:ms_server, :cdapi_path)}#{Application.get_env(:ms_server, :space_id)}/environments/#{Application.get_env(:ms_server, :environment)}/entries?access_token=#{Application.get_env(:ms_server, :access_token)}&content_type=recipe",
           [{"Content-type", "application/json"}]
         ) do
      {:ok, response} ->
        Poison.decode!(response.body)

      {_, _} ->
        {:ok, []}
    end
  end

  def entry(id, "Asset"), do: entry(id, "assets")
  def entry(id, "Entry"), do: entry(id, "entries")
  def entry(id), do: entry(id, "entries")

  def entry(id, link_type) do
    HTTPoison.start()

    case HTTPoison.get(
           "#{Application.get_env(:ms_server, :cdapi_path)}#{Application.get_env(:ms_server, :space_id)}/environments/#{Application.get_env(:ms_server, :environment)}/#{link_type}/#{id}?access_token=#{Application.get_env(:ms_server, :access_token)}",
           [{"Content-type", "application/json"}]
         ) do
      {:ok, response} ->
        Poison.decode!(response.body)

      {_, _} ->
        {:ok, %{}}
    end
  end
end
