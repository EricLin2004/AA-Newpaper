class NewspapersController < ApplicationController
  def new
  	@paper = Newspaper.new
    @paper.subscription_plans.build
  end

  def create
  	@paper = Newspaper.new(params[:newspaper])
  	if @paper.save
  		redirect_to newspapers_url
  	else
  		flash.now[:errors] = @paper.errors.full_messages
  		render :new
  	end

  end

  def index
  end


  def show
  	@paper = Newspaper.find(params[:id])
  end

  def destroy
  end
end
