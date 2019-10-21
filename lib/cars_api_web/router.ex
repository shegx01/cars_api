defmodule CarsApiWeb.Router do
  use CarsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CarsApiWeb do
    pipe_through :api
  end

  forward("/api", Absinthe.Plug, Schema: CarsApiWeb.Schema)
  forward("/graphiql", Absinthe.Plug.GraphiQL, CarsApiWeb.Schema, interface: :advanced)
end
