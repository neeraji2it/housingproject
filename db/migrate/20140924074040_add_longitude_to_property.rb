class AddLongitudeToProperty < ActiveRecord::Migration
  def change
    change_column :properties,:longitude,:float
    remove_column :properties,:lattitude
  end
end
