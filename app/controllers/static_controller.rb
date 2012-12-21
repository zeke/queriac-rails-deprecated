class StaticController < ApplicationController
  
  def index
    @commands = Command.includes(:user).all
    @users = User.all
  end
  
  def engine
    # e.g. http://localhost:3000 or https://productionserver.com
    base_url = [request.protocol, request.host_with_port].join("")
    render :js => "javascript: " + File.open(Rails.root.join("public/engine.js")).read.gsub("BASE_URL", base_url)
  end
  
  def help
  end
  
end
