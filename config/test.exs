use Mix.Config

# Configure your database
config :cars_api, CarsApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "cars_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cars_api, CarsApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
