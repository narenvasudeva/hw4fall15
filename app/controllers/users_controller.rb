class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id, :email)
  end
  
  def new
    # default: render 'new' template
  end

  def create
    #if User.find_by_user_id(params[:user_id]).present?
    @user = User.new(user_params)
    #@user = User.find_by user_id: params[:user_id]
    #print "params = "
    #print params
    #print "\n"
    #print "@user.user_id = "
    #print @user.user_id
    #print "\n"

    if User.find_by(user_id: @user.user_id).present?
      flash[:warning] = "Sorry, this user-id is taken. Try again."
      redirect_to new_user_path
    else
      @user = @user.create_user!({:user_id => @user.user_id, :email => @user.email})
      flash[:notice] = "Welcome #{@user.user_id}. Your account has been created"
      redirect_to login_path
    end
  end

end