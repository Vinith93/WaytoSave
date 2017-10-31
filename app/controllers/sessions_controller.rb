class SessionsController < ApplicationController
  def create
    if user = User.authenticate(params[:email],params[:password])
      session[:user_id] = user.id
      redirect_to edit_user_path(session[:user_id]), :notice => 'Logged in Successfully'
    else
      flash[:alert] = "Invalid User Email / Password"
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    redirect_to login_sessions_path, :notice => 'Logged out successfully'
  end
end
