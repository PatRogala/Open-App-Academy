class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      @user.reset_session_token!
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ['Invalid username or password']
      render :new
    end
  end
end
