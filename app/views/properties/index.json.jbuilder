json.array!(@properties) do |property|
  json.extract! property, :id, :type_of_land, :title, :price, :rate, :area, :person_type, :city, :location, :description, :name, :email, :mobile, :lattitude, :longitude, :view_count, :contact_count, :electricity_type, :present_land_status, :boundary_status, :drainage_status, :inleave_rode, :shed_status, :borewell_status, :land_status
  json.url property_url(property, format: :json)
end
