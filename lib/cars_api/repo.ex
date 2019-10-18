defmodule CarsApi.Repo do
  use Ecto.Repo,
    otp_app: :cars_api,
    adapter: Ecto.Adapters.Postgres
end
