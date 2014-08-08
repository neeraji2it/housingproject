class AddGmapsToProperties < ActiveRecord::Migration
  def change
    change_column :properties, :gmaps, :boolean
    add_column :properties, :latitude, :float
  end
end
