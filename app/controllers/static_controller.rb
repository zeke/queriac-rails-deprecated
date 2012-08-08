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
    render :js => files.join(";\n\n")
  end
  
end
