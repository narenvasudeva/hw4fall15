class SessionsController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id, :email)
  end

  def new
    # default: render 'new' template
  end

  def create
    @user = User.new(user_params)
    @tempUser = User.find_by_user_id(@user.user_id)
    if @tempUser.present? && @tempUser.email==@user.email
      session[:user_logged] = "You are logged in as #{@user.user_id}"
      session[:session_token] = @tempUser.session_token
      redirect_to movies_path
    else
      flash[:warning] = "Invalid User‐ID/E-mail combination"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to movies_path
  end
  
end