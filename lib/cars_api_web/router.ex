defmodule CarsApiWeb.Router do
  use CarsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CarsApiWeb do
    pipe_through :api
  end
end
