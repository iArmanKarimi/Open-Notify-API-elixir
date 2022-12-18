defmodule OpenNotifyApi do
  @moduledoc """
  Open Notify API client for elixir
  """
  @url_iss_location "http://api.open-notify.org/iss-now.json"
  @url_people_in_space "http://api.open-notify.org/astros.json"

  :inets.start()

  @spec get(String.t()) :: String.t() | {:error, any}
  @doc """
  Sends http get request
  """
  def get(url) do
    case :httpc.request(url) do
      {:ok, {{_, status_code, title}, _, body}} ->
        case status_code do
          # todo: when string
          200 -> {:ok, body}
          _ -> {:error, "#{title}: #{status_code}"}
        end

      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Gets the current location of ISS (International Space Station)

  ## Examples
  """
  def get_iss_location do
    case get(@url_iss_location) do
      {:ok, body} ->
        nil

      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Get the current number of people in space. It also returns the names and spacecraft those people are on.

  ## Examples
  """
  def get_people_in_space do
    case get(@url_people_in_space) do
      {:ok, body} ->
        nil

      {:error, error} ->
        {:error, error}
    end
  end
end
