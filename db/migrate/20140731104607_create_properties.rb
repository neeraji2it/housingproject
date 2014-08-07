class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :type_of_land
      t.string :title
      t.decimal :price
      t.decimal :rate
      t.decimal :area
      t.string :person_type
      t.string :city
      t.string :location
      t.text :description
      t.string :name
      t.string :gmaps
      t.string :email
      t.string :mobile
      t.decimal :lattitude
      t.decimal :longitude
      t.integer :view_count
      t.integer :contact_count
      t.string :electricity_type
      t.string :present_land_status
      t.string :boundary_status
      t.string :drainage_status
      t.string :inleave_rode
      t.string :shed_status
      t.string :borewell_status
      t.string :land_status
      t.attachment :document
      t.attachment :image
      t.timestamps
    end
  end
 
end
