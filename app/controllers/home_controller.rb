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
    @json = @properties.to_gmaps4rails
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
  
  
    def image_slide
    @property = Property.find(params[:id])
    @images = Image.where(:property_id =>@property.id)
  end
  
  
  
  def main_home
    render :layout => false
  end
  
  
  def jointventure
    render :layout => false
  end


end