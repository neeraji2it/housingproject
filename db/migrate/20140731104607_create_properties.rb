class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :type_of_land
      t.string :title
      t.decimal :price
      t.decimal :area
      t.string :city
      t.string :location
      t.text :description
      t.string :name
      t.boolean :gmaps
      t.string :email
      t.string :mobile
      t.float :latitude
      t.float :longitude
      t.integer :view_count
      t.integer :contact_count
      t.string :present_land_status
      t.string :land_status
      t.attachment :document
      t.attachment :image
      t.timestamps
    end
  end
 
end

