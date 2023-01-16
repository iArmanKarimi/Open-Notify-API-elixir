# Open Notify API (elixir)

Open Nofity API client for elixir

> Open Notify is an open source project to provide a simple programming interface for some of NASA’s awesome data.

For other languages, see [Open Notify API clients](https://github.com/iArmanKarimi/Open-Notify-API-clients)

## Installation

## Examples

Number of People in Space:

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

Current Location of the International Space Station:

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

## References

[Open Notify Website](http://open-notify.org/)

[Official API documentation](http://open-notify.org/Open-Notify-API/)

## License

[MIT](https://github.com/iArmanKarimi/Open-Notify-API-elixir/blob/main/LICENSE)
