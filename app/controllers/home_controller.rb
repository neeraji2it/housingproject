class HomeController < ApplicationController
  
  def index
  end
  
  def land
    @properties = Property.where(:city => params[:city]).order(:price)
    @json2 = @properties.to_gmaps4rails
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
  
    
  def about_us
  end
  def privacy_policy
  end
  def help
  end
  
  def gallery
    @property = Property.find(params[:id])
    @images = Image.where(:property_id =>@property.id)
  end
  
end