# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :peepchat,
  ecto_repos: [Peepchat.Repo]

# Configures the endpoint
config :peepchat, Peepchat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Z3w6kNrfI/yWIlvbbD57SOuN35691ahxKdM8z7gjPRrRunJNw8YM5sYDZ//SyUc3",
  render_errors: [view: Peepchat.ErrorView, accepts: ~w(json)],
  pubsub: [name: Peepchat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# JSON API
config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => {"json-api"}
}

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Peepchat",
  ttl: { 30, :days },
  verify_issuer: true,
  secret_key: System.get_env("GUARDIAN_SECRET") || "bKl2BOd9NJwRB9b9/qnuV9yKoaFQqw0Nn7VSvoS1aiQ6pGYLcJoqrxyYCl1ARz0O",
  serializer: Peepchat.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
