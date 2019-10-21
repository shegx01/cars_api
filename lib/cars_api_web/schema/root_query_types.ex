defmodule CarsApi.Schema.RootQueryTypes do
  use Absinthe.Schema.Notation

  @desc "query different parameters on car object"
  object :car_item_query do
    field :car_items, list_of(:car_item) do
      arg(:filter, :car_item_filter)
    end
  end

end
