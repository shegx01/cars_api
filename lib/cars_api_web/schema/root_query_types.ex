defmodule CarsApiWeb.Schema.RootQueryTypes do
  alias CarsApiWeb.Resolvers
  use Absinthe.Schema.Notation

  @desc "query different parameters on car object"
  object :car_item_query do
    field :car_items, list_of(:car_item) do
      resolve &Resolvers.CarResolvers.resolve_car_item/3

    end
  end

end
