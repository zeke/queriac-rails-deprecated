class CommandsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def execute
    param_parts = params[:command_and_query].split(' ')
    keyword = param_parts.shift
    query = param_parts.join(' ')
    command = current_user.commands.find_by_keyword(keyword) || not_found
    render :js => command.execute(query)
  end
  
end
