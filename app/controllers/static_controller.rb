class StaticController < ApplicationController
  
  def index
    @commands = Command.includes(:user).all
    @users = User.all
  end
  
  def engine
    files = [
      "javascript:",
      File.open(Rails.root + "public/locomotive.js").read,
      File.open(Rails.root + "public/zepto.min.js").read,
      File.open(Rails.root + "public/caboose.js").read,
    ]
    
    # e.g. http://localhost:3000, or https://productionserver.com
    base_url = [request.protocol, request.host_with_port].join("")
    
    render :js => files.join(";\n\n").gsub("BASE_URL", base_url)
  end
  
end
