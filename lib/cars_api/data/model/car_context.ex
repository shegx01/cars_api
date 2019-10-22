defmodule CarsApi.Data.Model.CarContext do
  alias CarsApi.Repo
  import Ecto.Query
  alias CarsApi.Data.Schema.Cars

  def all() do
    Repo.all(Cars)
  end

  def car_item_query(params) do
    inspect(params)

    Enum.reduce(params, Cars, fn
      {:take, %{amount: amount, offset: offset}}, query when is_integer(amount) ->
        from(query, limit: ^amount, offset: ^offset)

      {:price_range, %{min: mini, max: maxi}}, query ->
        from q in query, where: q.base_price >= ^mini and q.base_price <= ^maxi

      {:year_range, %{min: mini, max: maxi}}, query ->
        from q in query, where: q.year >= ^mini and q.year <= ^maxi
    end)
    |> Repo.all()
  end
end
