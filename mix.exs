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
            {:amqp_client, git: "https://github.com/rabbitmq/rabbitmq-erlang-client.git", tag: "v3.7.0", override: true},
            {:rabbit_common, git: "https://github.com/rabbitmq/rabbitmq-common.git", tag: "v3.7.0", override: true},
            {:ranch_proxy_protocol, "~> 1.4"},
            {:recon, "~> 2.3.2"},

            {:earmark, "~> 1.2", only: :docs},
            {:ex_doc, "~> 0.16.3", only: :docs},
            {:inch_ex, "~> 0.5.6", only: :docs},

            {:dialyxir, "~> 0.5.1", only: :dev, runtime: false}
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
