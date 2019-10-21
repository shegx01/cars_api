defmodule CarsApi.Data.Schema.Cars do
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @permitted_fields [
    :stock_number,
    :year,
    :make,
    :model,
    :body,
    :trim,
    :base_price,
    :msrp,
    :image_count,
    :mileage,
    :interior_color,
    :exterior_color,
    :transmission,
    :features,
    :image
  ]

  schema "cars" do
    field :stock_number, :integer, null: false
    field :year, :integer
    field :make, :string
    field :model, :string
    field :body, :string
    field :trim, :string
    field :base_price, Money.Ecto.Amount.Type
    field :msrp, :float
    field :image_count, :integer, null: false, default: 0
    field :mileage, :integer
    field :exterior_color, :string
    field :interior_color, :string
    field :transmission, :string
    field :features, {:array, :string}
    field :image, :string

    timestamps()
  end

  def changeset(%__MODULE__{} = model, params \\ %{}) do
    model
    |> cast(params, @permitted_fields)
    |> unique_constraint(:stock_number)
  end
end
