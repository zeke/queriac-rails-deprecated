class CommandsController < ApplicationController
  
  
  def new
    @command = Command.new
  end
  
  def fork
    @user = User.find_by_nickname(params[:user_id])
    @new_command = @user.commands.find_by_keyword(params[:id]).fork(current_user)
    redirect_to user_command_path(current_user, @new_command)
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
    args = params[:keyword_and_args].gsub("+", ' ').split(' ')
    keyword = args.shift
    command = current_user.commands.find_by_keyword(keyword) || not_found
    render :js => command.execute(args)
  end
  
  def destroy
    @command = current_user.commands.find_by_keyword(params[:id])
    @command.destroy
    
    respond_to do |format|
      format.html do 
        if request.xhr?
          render :json => @command.to_json
        else
          redirect_to(root_path, :notice => "Command deleted.")
        end
      end
    end
  end  
    
end
