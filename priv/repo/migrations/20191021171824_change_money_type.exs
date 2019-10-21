defmodule CarsApi.Repo.Migrations.ChangeMoneyType do
  use Ecto.Migration

  def up do
    alter table(:cars) do
      remove(:base_price)
      add(:base_price, :integer)
    end
  end

  def down do
    alter table(:cars) do
      remove(:base_price)
      add(:base_price, :map)
    end
  end
end
