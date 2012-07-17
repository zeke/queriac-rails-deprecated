class StaticController < ApplicationController
  
  def index
    @commands = Command.includes(:user).all
    @users = User.all    
  end
  
  def test
    # result = Command.convert_to_javascript(@result)
    result = []
    result << "window.location='http://google.com?msg=#{params[:msg]}'"
    render :text => result.join(';')
  end
  
end
