defmodule CarsApiWeb.Schema.CarTypes do
  use Absinthe.Schema.Notation

  ##################################
  # object type of absinthe gql
  ##################################

  @desc "a single car item request from the store"
  object :car_item do
    field :stock_number, :integer, description: "unique carItem id"
    field :year, :integer, description: "ranges of the years the car was make"
    field :make, :string, description: "company that produces the car"
    field :model, :string, description: "car model idenfification"
    field :body, :string, description: "body type"
    field :trim, :string, description: "body trim type"
    field :base_price, :integer, description: "car base selling price"
    field :msrp, :float, description: "manufacturer's suggested retail price"
    field :image_count, :integer, description: "number of images available"

    field :mileage, :integer,
      description: "miles it has driven so far from the time of purchase as new"

    field :exterior_color, :string, description: "outer car color"
    field :interior_color, :string, description: "interior color of the car"

    field :transmission, :string,
      description: "gearbox transmission type e.g auto, n-speed and self-shifting"

    field :features, list_of(:string), description: "list of the features"

    field :image, :string, description: "an image others can gbet generated from the return url"
  end

  ##############################
  # car item filters
  ###########################
  @desc "filters for car items in the store "
  input_object :car_item_filter do
    field :stock_number, :integer, description: "request a single car by its transmission number"
    field :make, :string, description: "filter by car make "

    field :mileage, :integer,
      description: "filter by car mileage  7000 will return cars with mileage less than 7000"

    field :features, :string, description: "return cars that has keyword provided"
  end

  ######################################
  # enumerable type of absinthe gql
  ######################################

  @desc "color criteria for filtering with color"
  enum :color_value do
    value(:black)
    value(:blue)
    value(:gray)
    value(:white)
    value(:red)
    value(:gold)
    value(:purple)
    value(:yellow)
  end

  @desc "car transmission value that should be passed to  transmission for filtering"
  enum :transmission_value do
    value :automatic, description: "choice of transmission criteria"
    value :"Manual 5 Speed", description: "choice of transmission criteria"
    value :"Manual 6 Speed", description: "choice of transmission criteria"
    value :"Manual 7 Speed", description: "choice of transmission criteria"
  end

  #   @desc "sorting the car items based on value criterias"
  #   enum :sort_by do
  #     value :lowest_price
  #     value :highest_price
  #     value :lowest_mileage
  #     value :highest_mileage
  #     value :newest_year
  #     value :oldest_year
  #   end

  #####################################
  # input object types
  #####################################

  input_object :take_input do
    field :amount, non_null(:integer), description: "amount of cars to receive in one request"
    field :offset, :integer, default_value: 0, description: "set offset for received car items"
  end

  @desc "object to provide minimum and maximum or both min-max requirement for filter criteria"
  input_object :range_input do
    field :min, :integer,
      default_value: 0,
      description: "minimum value required for search critiria"

    field :max, :integer, description: "maximum value required for search criteria"
  end

  @desc "object to provide interior and exterior color for filter criteria"
  input_object :color_input do
    field :exterior_color, :color_value
    field :interior_color, :color_value
  end
end
