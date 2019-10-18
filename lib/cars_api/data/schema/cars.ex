defmodule CarsApi.Data.Schema.Cars do
  use Ecto.Schema

  schema "cars" do
    field :stock_number, :integer
    field :year, :integer
    field :make, :string
    field :model, :string
    field :body, :string
    field :trim, :string
    field :base_price, :integer
    field :msrp, :integer
    field :image_count, :integer
    field :mileage, :integer
    field :exterior_color, :string
    field :interior_color, :string
    field :transmission, :string
    field :features, {:array, :string}
    field :images, {:array, :string}

    timestamps()

  end
end
