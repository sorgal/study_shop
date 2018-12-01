use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :study_shop, StudyShopWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :study_shop, StudyShop.Repo,
  username: "postgres",
  password: "postgres",
  database: "study_shop_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
