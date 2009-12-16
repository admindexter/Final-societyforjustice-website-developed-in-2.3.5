class SessionsController < ApplicationController
  layout 'sessions_edit'
  def create
  	session[:password] = params[:password]
  	flash[:notice] = 'Successfully logged in'
  	redirect_to :controller => "site"
  end
  
  def destroy
  	reset_session
  	flash[:notice] = 'Successfully logged out'
  	redirect_to login_path
  end
end