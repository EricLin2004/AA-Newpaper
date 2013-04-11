class UsersController < ApplicationController
  def new
  end

  def create
  	user = User.new(params[:user])
  	if user.save
  		flash[:success] = "User has been created!"
  		log_in(user, user.password)
  		redirect_to newspapers_url
  	else
  		flash[:errors] = "Error creating user, please try again"
  		redirect_to root_url
  	end
  end

  def edit
    user = User.find_by_remember_token(session[:remember_token])
    user.subscription_plans << SubscriptionPlan.find(params[:subscription_plan_id])
    if user.save
      flash[:success] = "Subscription added!"
    else
      flash[:errors] = "Failed to add subscription"
    end
    redirect_to newspapers_url
  end

  def show
    @user = User.find_by_remember_token(session[:remember_token])
  end

  def update
    @user = User.find(params[:id])
    @user.subscription_plans.delete(SubscriptionPlan.find(params[:subscription_plan_id]))
     if @user.save
      flash[:success] = "Subscription removed!"
    else
      flash[:errors] = "Failed to remove subscription"
    end
    render :show
  end
end
