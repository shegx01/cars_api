defmodule CarsApi.Data.Model.CarContext do
  alias CarsApi.Repo
  import Ecto.Query
  alias CarsApi.Data.Schema.Cars

  def all() do
    Repo.all(Cars)
  end

  def get_by_stock_num(stock_num) do
    query = from(c in Cars, where: c.stock_number == ^stock_num)

    Repo.one(query)
  end

  def car_item_query(params) do

    Enum.reduce(params, Cars, fn
      {:take, %{amount: amount, offset: offset}}, query_chain  when is_integer(amount) and is_integer(offset) ->
        from(query_chain, limit: ^amount, offset: ^offset)

      {:filter, filter}, query_chain ->
        query_chain |> filter_query(filter)
      |> Repo.all()


    end )
  end

  defp filter_query(query, params) do
    
  end
end
