defmodule CarsApi.Data.Schema.Cars do
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

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

  @permitted_fields ~w(stock_number, year, make, model, body, trim, base_price, msrp, image_count, mileage, exterior_colour, interior_color, transmission, features, images)a

  def changeset(%__MODULE__{} = model, params) do
    model
    |> cast(params, @permitted_fields)
    |> validate_required(@permitted_fields)
  end
end
