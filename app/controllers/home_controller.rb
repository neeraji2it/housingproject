class HomeController < ApplicationController
  
  def index
    
  end
  
  def home1
   
  end
  
  def land
    @properties = Property.where(:city => params[:city]).order("created_at asc")
    
    if params[:search].present? and (!params[:search][:location].blank? )
      # do something
    end
    
    @json1 = "[{\"lat\":#{params[:lat]},\"lng\":#{params[:lon]}}]"
    @json2 = @properties.to_gmaps4rails
    @lat = params[:lat]
    @lon = params[:lon]
    @json = (@json1 + @json2).gsub("][",",")
    @city = params[:city]
  end
  
  def land1
    @property = Property.find(params[:id])
    @properties = Property.where(:city => @property.city)
    
    
    @json = @property.to_gmaps4rails
    @images = Image.where(:property_id =>@property.id)
  end

  def location_search
    @properties = Property.all
    if params[:search].present? and (!params[:search][:location].blank?)
      @properties = Property.location(params[:search][:location])
    end
  end
  
  
  def gallery
    @property = Property.find(params[:id])
    @images = Image.where(:property_id =>@property.id)
  end
  
end