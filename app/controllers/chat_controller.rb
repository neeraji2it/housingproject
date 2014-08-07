class ChatController < ApplicationController
  def new

  end
  def create
        name = params[:chat][:name]
    email = params[:chat][:email]
    phone = params[:chat][:phone]
      message = params[:chat][:message]
    Chat.contact(email, name, phone, message).deliver
    return if request.xhr?
    redirect_to :home1_home_index, notice: 'we will get you soon'
  end
    private
  # Use callbacks to share common setup or constraints between actions.
  def set_chat
    @chat = Chat.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def chat_params
    params.require(:chat).permit!
  end
end


