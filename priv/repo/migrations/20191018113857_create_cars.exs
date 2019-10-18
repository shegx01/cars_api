defmodule CarsApi.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def up do

    create table("cars") do
      add :stock_number, :integer
      add :year, :integer
      add :make, :string
      add :model, :string
      add :body, :string
      add :trim, :string
      add :base_price, :integer
      add :msrp, :integer
      add :image_count, :integer
      add :mileage, :integer
      add :exterior_color, :string
      add :interior_color, :string
      add :transmission, :string
      add :features, {:array, :string}
      add :images, {:array, :string}
      timestamps()
    end

    create index("cars", [:make, :model, :year, :base_price, :mileage, :features, :exterior_color, :transmission])
  end

  def down do
    drop table("cars")
  end
end
