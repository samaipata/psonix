# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :psonix,
  ecto_repos: [Psonix.Repo]

# Configures the endpoint
config :psonix, Psonix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QOjTh9m/exf+27ev5nceLlSKHHBJl3EsjWRADhMM99MP1c5qwXWHhnzxKf56pz9u",
  render_errors: [view: Psonix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Psonix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
