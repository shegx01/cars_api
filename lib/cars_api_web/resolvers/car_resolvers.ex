defmodule CarsApiWeb.Resolvers.CarResolvers do
  alias CarsApi.Data.Model.CarContext

  def resolve_car_item(_, _, _) do

    {:ok, CarContext.all()}
  end
end
