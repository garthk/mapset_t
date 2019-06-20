defmodule MapSet.Typing.MixProject do
  use Mix.Project

  def project do
    [
      app: :mapset_t,
      version: "0.1.1",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false}
    ]
  end

  defp dialyzer do
    [
      list_unused_filters: true,
      plt_add_apps: [:mix],
      plt_add_deps: [:app_tree]
    ]
  end
end
