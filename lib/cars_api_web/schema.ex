defmodule CarsApiWeb.Schema do
  use Absinthe.Schema
  import_types(__MODULE__.RootQueryTypes)
  import_types(__MODULE__.CarTypes)

  query do
    import_fields(:car_item_query)
  end
end
