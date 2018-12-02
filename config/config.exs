# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :study_shop,
  ecto_repos: [StudyShop.Repo]

# Configures the endpoint
config :study_shop, StudyShopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DMWwTqmqavYhDiGNJvtTv+WWUhmXyRa//c+zX5wlDivfI0wXEyIGJ1PG8ySbPR6k",
  render_errors: [view: StudyShopWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: StudyShop.PubSub, adapter: Phoenix.PubSub.PG2],
  http: [protocol_options: [max_request_line_length: 8192, max_header_value_length: 8192]]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
