defmodule OpenNotifyApi do
  @moduledoc """
  Open Notify API client for elixir
  """
  @typedoc """

  """
  @url_iss_location "http://api.open-notify.org/iss-now.json"
  @url_people_in_space "http://api.open-notify.org/astros.json"

  :inets.start()

  defp get(url) do
    case :httpc.request(url) do
      {:ok, {{_, status_code, title}, _, body}} ->
        case status_code do
          # todo: when string
          200 -> {:ok, body |> to_string}
          _ -> {:error, "#{title}: #{status_code}"}
        end

      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Gets the current location of ISS (International Space Station)

  ## Examples
  ```elixir
  case OpenNotifyApi.get_iss_location() do
    {:ok, iss_location} ->
      IO.puts("Current location of International Space Station:")
      IO.puts("latitude: \#{iss_location.latitude}")
      IO.puts("longitude: \#{iss_location.longitude}")

      iss_location["timestamp"]
      |> DateTime.from_unix()
      |> case do
        {:ok, date_time} -> "Date and time: \#{date_time}" |> IO.puts()
      end

    {:error, error} ->
      IO.inspect(error)
  end
  ```
  """
  def get_iss_location do
    ## in honor of old code
    # map =
    #   &%{
    #     message: &1["message"],
    #     date_time: &1["timestamp"],
    #     latitude: &1["iss_position"]["latitude"],
    #     longitude: &1["iss_position"]["longitude"]
    #   }

    case get(@url_iss_location) do
      {:ok, body} ->
        body
        |> Jason.decode()

      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Get the current number of people in space. It also returns the names and spacecraft those people are on.

  ## Examples
  ```elixir
  case OpenNotifyApi.get_people_in_space() do
    {:ok, people_in_space} ->
      number = people_in_space["number"]
      IO.puts("There are \#{number} people in space right now.")

      people = people_in_space["people"]
      IO.puts("List of people in space:")

      for person <- people do
        name = person["name"]
        craft = person["craft"]
        IO.puts("name: \#{name}, craft: \#{craft}")
      end

    {:error, error} ->
      IO.puts(error)
  end
  ```
  """
  def get_people_in_space do
    case get(@url_people_in_space) do
      {:ok, body} ->
        body
        |> Jason.decode()

      {:error, error} ->
        {:error, error}
    end
  end
end
