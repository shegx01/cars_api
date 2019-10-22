defmodule CarsApiWeb.Resolvers.CarResolvers do
  alias CarsApi.Data.Model.CarContext

  def resolve_car_item(_, args, _) do
    {:ok, CarContext.car_item_query(args)}
  end
end
