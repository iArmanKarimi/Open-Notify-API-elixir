defmodule OpenNotifyApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :open_notify_api,
      description: "",
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/iArmanKarimi/Open-Notify-API-elixir",
      homepage_url: "https://github.com/iArmanKarimi/Open-Notify-API-elixir/blob/main/README.md",
      start_permanent: Mix.env() == :prod,
      package: [
        links: %{"GitHub" => "https://github.com/iArmanKarimi/Open-Notify-API-elixir"},
        licenses: ["MIT"],
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :inets]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
    ]
  end
end
