#db seed
alias CarsApi.Repo
alias CarsApi.Data.Schema.Cars
import Ecto.Changeset only: [change: 2]

lists = CarsApi.Tools.GenerateNewDataset.transform_elixir_map_struct("/home/shegx01/Desktop/cars_api/cars_api/items.bin")

Enum.each(list, fn ->

  Repo.insert!(struct, opts \\ [])
end)
