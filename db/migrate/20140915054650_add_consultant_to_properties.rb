class AddConsultantToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :consultant, :string
  end
end
