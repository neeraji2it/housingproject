class ContactusController < ApplicationController
#before_action :set_Contactus, :except=>["new","create","index"]
def new
  @contactus = Contactus.new

end

def index
@contactuses=Contactus.all
end





def create
  puts "-----------"
  @contactus = Contactus.new(contactus_params)
  
  if @contactus.save
    
    ContactMailer.contact_form(@contactus,@mesage).deliver
  
    flash[:message]= "your contact has been successfuly submited"
    redirect_to :back
  else 
    render "new"
  end
end






def destroy
  @contactus.destroy
  
redirect_to @contactuses_path
end








private

def set_contactus
  @contactus.find(params[:id])
end

def contactus_params
    params.require(:contactus).permit!
  
end


end




















