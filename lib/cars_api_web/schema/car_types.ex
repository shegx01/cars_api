defmodule CarsApiWeb.Schema.CarTypes do
  use Absinthe.Schema.Notation

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

  @desc "filters for car items in the store "
  input_object :car_item_filter do
    field :make, :string, description: "filter by car make "

    field :mileage, :integer,
      description: "filter by car mileage  7000 will return cars with mileage less than 7000"

    field :features, :string, description: "return cars that has keyword provided"

    field :car_color, :color_input,
      description: "return cars with exterior and or interior color match"
  end

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

  #   @desc "sorting the car items based on value criterias"
  #   enum :sort_by do
  #     value :lowest_price
  #     value :highest_price
  #     value :lowest_mileage
  #     value :highest_mileage
  #     value :newest_year
  #     value :oldest_year
  #   end

  @desc "object to provide interior and exterior color for filter criteria"
  input_object :color_input do
    field :exterior_color, :color_value
    field :interior_color, :color_value
  end

  @desc "object to provide minimum and maximum requirement for filter criteria"
  input_object :range_input do
    field :min, :integer, default_value: 0
    field :max, non_null(:integer)
  end

  #####################################
  # input object types
  #####################################

  input_object :take_input do
    field :amount, non_null(:integer), description: "amount of cars to receive in one request"
    field :offset, :integer, default_value: 0, description: "set offset for received car items"
  end
end
