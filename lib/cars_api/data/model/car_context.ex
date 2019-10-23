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

      {:price_range, %{max: maxi}}, query ->
        from q in query, where: q.base_price <= ^maxi

      {:price_range, %{min: mini}}, query ->
        from q in query, where: q.base_price >= ^mini

      {:price_range, %{min: mini, max: maxi}}, query ->
        from q in query, where: q.base_price >= ^mini and q.base_price <= ^maxi

      {:year_range, %{max: maxi}}, query ->
        from q in query, where: q.year <= ^maxi

      {:year_range, %{min: mini}}, query ->
        from q in query, where: q.year >= ^mini

      {:year_range, %{min: mini, max: maxi}}, query ->
        from q in query, where: q.year >= ^mini and q.year <= ^maxi

      {:transmission, transmission}, query ->
        from q in query, where: ilike(q.transmission, ^"#{Atom.to_string(transmission)}")

      {:color, color}, query ->
        query |> filter_color(color)

      {:filter, filter}, query ->
        query |> filter_car_field(filter)

      {:sort, :lowest_price}, query ->
        from q in query, order_by: q.base_price

      {:sort, :highest_price}, query ->
        from q in query, order_by: [desc: q.base_price]

      {:sort, :lowest_mileage}, query ->
        from q in query, order_by: q.mileage

      {:sort, :newest_year}, query ->
        from q in query, order_by: [desc: q.year]

      {:sort, :oldest_year}, query ->
        from q in query, order_by: q.year

      {:sort, :highest_mileage}, query ->
        from q in query, order_by: [desc: q.mileage]
    end)
    |> Repo.all()
  end

  defp filter_car_field(query, field) do
    field
    |> Enum.reduce(query, fn
      {:stock_number, stk_number}, query ->
        from q in query, where: q.stock_number == ^stk_number

      {:make, make}, query ->
        from q in query, where: ilike(q.make, ^"%#{make}%")

      {:model, model}, query ->
        from q in query, where: ilike(q.model, ^"%#{model}%")

      {:mileage, mileage}, query ->
        from q in query, where: q.mileage <= ^mileage

      {:features, feature_search_str}, query ->
        from q in query,
          where:
            fragment(
              "exists (select * from unnest(?) tag where tag ilike ?)",
              q.features,
              ^"%#{feature_search_str}%"
            )
    end)
  end

  defp filter_color(query, color) do
    color
    |> Enum.reduce(query, fn
      {:exterior_color, ext_color_value}, query ->
        from q in query, where: q.exterior_color == ^Atom.to_string(ext_color_value)

      {:interior_color, int_color_value}, query ->
        from q in query, where: ilike(q.interior_color, ^"#{Atom.to_string(int_color_value)}")
    end)
  end
end
