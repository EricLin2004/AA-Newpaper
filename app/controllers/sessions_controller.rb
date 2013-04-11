class SessionsController < ApplicationController
  def new
    unless session[:remember_token].nil?
      log_out
  	end
  end

  def create
  	@user = User.find_by_name(params[:user][:name])
  	log_in(@user, params[:user][:password])
  	unless session[:remember_token]
  		render :new
  	else
  		redirect_to newspapers_url
  	end
  end

  def destroy
  	log_out

  	redirect_to root_url
  end
end
