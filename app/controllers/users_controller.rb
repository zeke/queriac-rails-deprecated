class UserController < ApplicationController
  
  # before_filter :authenticate_user!
  
  def show
    @user = User.find(params[:user_id])
  end
  
end
