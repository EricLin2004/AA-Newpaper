class SessionsController < ApplicationController
  def new
  	session[:remember_token] = nil
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
