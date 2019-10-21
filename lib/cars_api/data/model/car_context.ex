defmodule CarsApi.Data.Model.CarContext do
  alias CarsApi.Repo
  import Ecto.Query
  alias CarsApi.Data.Schema.Cars



  def all() do
    Repo.all(Cars)
  end

  def get_by_stock_num(stock_num) do
    query =
      from(c in Cars, where: c.stock_number == ^stock_num )

      Repo.one query
  end

  
end
