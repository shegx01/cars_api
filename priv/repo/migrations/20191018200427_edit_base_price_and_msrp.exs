defmodule CarsApi.Repo.Migrations.EditBasePriceAndMsrp do
  use Ecto.Migration

  def up do
    alter table(:cars) do
      remove(:msrp)
      add(:msrp, :float)
    end
  end

  def down do
    alter table(:cars) do
      remove(:msrp)
      add(:msrp, :integer)
    end
  end
end
