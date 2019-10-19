defmodule CarsApi.Repo.Migrations.AddImageColumn do
  use Ecto.Migration

  def up do
    alter table(:cars) do
      add(:image, :string)
    end

    create unique_index(:cars, :stock_number)
  end

  def down do
    alter table(:cars) do
      remove(:image)
    end
  end
end
