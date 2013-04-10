class SubscriptionPlansController < ApplicationController
  def new
  	@paper = Newspaper.find(params[:newspaper_id])
  	@sub = SubscriptionPlan.new
  end

  def create
  	sub = SubscriptionPlan.new(params[:subscription_plan])
  	if sub.save
  		redirect_to Newspaper.find(params[:subscription_plan][:newspaper_id])
  	else
  		flash.now[:errors] = sub.errors.full_messages
  		render :new
  	end
  end

  def index
  end

  def show
  end
end
