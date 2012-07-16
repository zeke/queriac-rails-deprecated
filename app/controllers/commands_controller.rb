class CommandsController < ApplicationController
  
  
  def new
    @command = Command.new
  end
  
  def create
    @command = current_user.commands.new(params[:command])

    if @command.save
      redirect_to @command
    else
      render :action => "new"
    end
  end
  
  def show
    @user = User.find_by_nickname(params[:nickname])
    @command = @user.commands.find_by_keyword(params[:keyword])
  end
  
  def execute
    param_parts = params[:keyword_and_query].split(' ')
    keyword = param_parts.shift
    query = param_parts.join(' ')
    command = current_user.commands.find_by_keyword(keyword) || not_found
    render :js => command.execute(query)
  end
  
end
