class UsersController < ApplicationController

  
  def new
 
    @user = User.new 
  
  end



  def create
    @user = User.new(user_params)
    if @user.save
      #@user.send_reset_password_instructions
      sign_in(@user)
      redirect_to "/"
    else
      flash[:error]="failed to create User account"
      render "new"
    end
  end

  private
  
  def user_params
    params.require(:user).permit!
  end
  



end