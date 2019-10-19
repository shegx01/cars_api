defmodule CarsApi.Repo.Migrations.AddDbCustomTypeDropImages do
  use Ecto.Migration

  def up do
    alter table(:cars) do
      remove(:images)
      remove(:base_price)
      add(:base_price, :map)
    end
  end

  def down do
    alter table(:cars) do
      add(:images, {:array, :string})
      remove(:base_price)
      add(:base_price, :integer)
    end
  end
end
