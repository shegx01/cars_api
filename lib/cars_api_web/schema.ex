defmodule CarsApiWeb.Schema do
  use Absinthe.Schema
  # alias CarsApiWeb.Schema.MiddleWare
  import_types(__MODULE__.RootQueryTypes)
  import_types(__MODULE__.CarTypes)

  query do
    import_fields(:car_item_query)
  end


#   ########################
#   # middleware for error traversa;
# def middleware(middleware, _field, %{identifier: :car_item}) do

#   middleware ++ [MiddleWare.ChangesetErrors]
# end

# def middleware(middleware, _,_) do
#   middleware
# end

end


