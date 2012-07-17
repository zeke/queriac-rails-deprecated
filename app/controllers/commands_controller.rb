class CommandsController < ApplicationController
  
  
  def new
    @command = Command.new
  end
  
  def create
    @command = current_user.commands.new(params[:command])

    if @command.save
      redirect_to [current_user, @command]
    else
      render :action => "new"
    end
  end
  
  def show
    @user = User.find_by_nickname(params[:user_id])
    @command = @user.commands.find_by_keyword(params[:id])
  end
  
  def edit
    # raise params.inspect
    @command = current_user.commands.find_by_keyword(params[:id])
  end
  
  def update
    @command = current_user.commands.find_by_keyword(params[:id])
    if @command.update_attributes(params[:command])
      redirect_to [current_user, @command]
    else
      render :action => "edit"
    end
  end
  
  def execute
    args = params[:keyword_and_args].split(' ')
    keyword = args.shift
    command = current_user.commands.find_by_keyword(keyword) || not_found
    render :js => command.execute(args)
  end
    
end
