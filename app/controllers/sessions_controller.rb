class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
      redirect_to goals_url
    else
      flash.now[:errors]  = ['invalid login']
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
