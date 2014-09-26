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
  
    
  def list_property
    if request.post?
      Contact.send_contact(params[:selectreq],params[:selectcity], params[:username], params[:email], params[:usrtel], params[:req]).deliver
         flash[:message] = "your property has been successfuly submited"
      redirect_to '/'
    else
     render :partial => "list_property"
    end
  end
  
  
  
  
  def show
    
  end
  
  def land
      @properties = Property.where(:city => params[:city]).order(:price)
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
  
  def main_home
    render :layout => false
  end
  
  
  def jointventure
    render :layout => false
  end

end