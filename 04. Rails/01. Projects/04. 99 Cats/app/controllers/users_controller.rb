class UsersController < ApplicationController
  before_action :require_logged_out, only: %i[new create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
