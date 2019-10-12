defmodule Moneybirx.MixProject do
  use Mix.Project

  def project do
    [
      app: :moneybirx,
      version: "0.1.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Moneybirx.Application, [env: Mix.env]},
      applications: applications(Mix.env)
    ]
  end

  defp applications(:test), do: applications(:default) ++ [:cowboy, :plug]
  defp applications(_),     do: [:httpoison]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 3.1"},
    ]
  end
end
