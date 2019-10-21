defmodule CarsApiWeb.Router do
  use CarsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CarsApiWeb do
    pipe_through :api
  end

  forward("/api", Absinthe.Plug, schema: CarsApiWeb.Schema)
  forward("/graphiql", Absinthe.Plug.GraphiQL, schema: CarsApiWeb.Schema, interface: :advanced)
end
