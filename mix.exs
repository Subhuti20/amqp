defmodule AMQP.Mixfile do
    use Mix.Project

    @version "1.0.2"

    def project do
        [
            app: :amqp,
            version: @version,
            elixir: "~> 1.4",
            description: description(),
            package: package(),
            source_url: "https://github.com/ztran/amqp",
            deps: deps(),
            dialyzer: [
                ignore_warnings: "dialyzer.ignore-warnings",
                plt_add_deps: :transitive,
                flags: [:error_handling, :race_conditions, :no_opaque, :underspecs]
            ],
            docs: [
                extras: ["README.md"],
                main: "readme",
                source_ref: "v#{@version}",
                source_url: "https://github.com/ztran/amqp"
            ]
        ]
    end

    def application do
        [applications: [:logger, :amqp_client]]
    end

    defp deps do
        [
            {:amqp_client, "~> 3.7"},
            {:rabbit_common, "~> 3.7"},
        ]
    end

    defp description do
        """
            Idiomatic Elixir client for RabbitMQ.
        """
    end

    defp package do
        [
            files: ["lib", "mix.exs", "README.md", "LICENSE"],
            maintainers: ["Paulo Almeida", "Eduardo Gurgel"],
            licenses: ["MIT"],
            links: %{
                "GitHub" => "https://github.com/pma/amqp"
            }
        ]
    end
end
