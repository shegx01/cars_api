defmodule CarsApiWeb.Schema.RootQueryTypes do
  alias CarsApiWeb.Resolvers
  use Absinthe.Schema.Notation

  @desc "query different parameters on car object"
  object :car_item_query do
    field :car_items, list_of(:car_item) do
      arg(:take, :take_input)
      arg(:filter, :car_item_filter)
      arg(:price_range, :range_input)
      arg(:year_range, :range_input)
      arg(:transmission, :transmission_value)
      arg(:color, :color_input)
      arg(:sort, :sort_by)
      resolve(&Resolvers.CarResolvers.resolve_car_item/3)
      
    end
  end
end
