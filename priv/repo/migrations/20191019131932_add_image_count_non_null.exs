defmodule CarsApi.Repo.Migrations.AddImageCountNonNull do
  use Ecto.Migration

  def up do
    alter table(:cars) do
      remove(:image_count)
      add(:image_count, :integer, null: false, default: 0)
    end
  end

  def down do
    alter table(:cars) do
      remove(:image_count)
      add(:image_count, :integer, default: 0, null: false)
    end
  end
end
