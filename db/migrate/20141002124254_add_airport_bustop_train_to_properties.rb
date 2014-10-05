class AddAirportBustopTrainToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :airport_lat, :float
    add_column :properties, :airport_lng, :float
    add_column :properties, :bus_lat, :float
    add_column :properties, :bus_lng, :float
    add_column :properties, :train_lat, :float
    add_column :properties, :train_lng, :float
  end
end