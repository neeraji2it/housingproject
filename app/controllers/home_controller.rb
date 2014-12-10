class HomeController < ApplicationController

  def index
    
    
  end
  
  def requirement
    if request.post?
      Contact.send_contact(params[:selectreq],params[:selectcity], params[:username], params[:email], params[:usrtel], params[:req]).deliver
      flash[:notice] = "your Requirement has been successfuly submited"
      redirect_to '/'
    else
      render :partial => "requirement"
    end
  end
  
  def show
    
  end
  
  def land
    if params[:price] == "low"
      @properties = Property.where(:city => params[:city]).order("price asc")
      
    elsif params[:price] == "high"
      @properties = Property.where(:city => params[:city]).order("price desc")
    elsif params[:price] == "lasc"
      @properties = Property.where(:city => params[:city]).order("location asc")
    elsif params[:price] == "lsdc"
      @properties = Property.where(:city => params[:city]).order("location desc")
    else
      @properties = Property.where(:city => params[:city]).order(:price)
    end
    @city = params[:city]
#    @json = @properties.to_gmaps4rails
    @hash = Gmaps4rails.build_markers(@properties) do |property, marker|
      marker.lat property.latitude
      marker.lng property.longitude
      marker.json({ :id => property.id })
    end
  end
  
  def land1
    @property = Property.find(params[:id])
    @properties = Property.where(:city => @property.city)
    
    property = @property.dup
    
    property_for_bus = @property.dup
    property_for_bus.longitude = property_for_bus.bus_lng
    property_for_bus.latitude = property_for_bus.bus_lat
    
    property_for_train = @property.dup
    property_for_train.longitude = property_for_train.train_lng
    property_for_train.latitude = property_for_train.train_lat
    
    property_for_airport = @property.dup
    property_for_airport.longitude = property_for_airport.airport_lng
    property_for_airport.latitude = property_for_airport.airport_lat
    
    @managed_property = [ property, property_for_bus, property_for_train, property_for_airport ].compact
    
#    @json = @managed_property.to_gmaps4rails
    @hash = Gmaps4rails.build_markers(@managed_property) do |property, marker|
      marker.lat property.latitude
      marker.lng property.longitude
    end
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
  
  def aboutus_mobile
    render :layout => false
  end
  
  def services_mobile
    render :layout => false
  end
  
  def contactus_mobile
    render :layout => false
     end
  
  def privacy_policy
  end
  
  def help
  end
  
  def gallery
    @property = Property.find(params[:id])
    @images = Image.where(:property_id =>@property.id)
  end
  
  
    def image_slide
    @property = Property.find(params[:id])
    @images = Image.where(:property_id =>@property.id)
  end
  
  
  
    def main_home
      render :layout => false
      @device = request.env['mobvious.device_type']
      puts "DFFCXXCFXFXFFSFDSF"
      p @device
      p "DSFSFSFDSFDSFDSFDSFSDF"
    end
  
  
  def jointventure
    render :layout => false
  end
  
  def map_options
    @property = Property.find(params[:id])
  end

end