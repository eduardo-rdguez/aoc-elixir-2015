defmodule AocElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :aoc_elixir,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.json": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto, :b58, :flow, :ex_doc, :excoveralls]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:b58, "~> 1.0.2"},
      {:flow, "~> 1.2.0"},
      {:ex_doc, "~> 0.28.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.14.4", only: :test}
    ]
  end
end
