class UsersController < ApplicationController

  def show
    @user = User.find_by_nickname(params[:id])
    @commands = @user.commands.order("commands.updated_at DESC").all
  end
  
end
