class ContactController < ApplicationController
  
  def new
    @contact = Contact.new
  end
  
  def create
   
    name = params[:contact][:name]
    email = params[:contact][:email]
    mobile = params[:contact][:mobile]
    ContactMailer.contact(email, name, mobile).deliver
    return if request.xhr?
    redirect_to :back, notice: 'we will get you soon'
  
  end

  def show
     
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit!
  end
end
