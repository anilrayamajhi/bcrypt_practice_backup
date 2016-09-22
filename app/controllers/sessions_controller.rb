class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      #create a sessions
      session[:user_id] = @user.id  #session is rails hash; here session user_id key is assigned with user.id
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
