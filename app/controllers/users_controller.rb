class UsersController < ApplicationController

 before_filter :signed_in_user, only: [:index, :show]
  
  def new
  @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  
  
  	 def create
	  @user = User.new(params[:user])
      if @user.save
      # Handle a successful save
			session[:current_user_id] = @user.id
			sign_in @user			
	        flash[:success] = "Welcome to the Sample App!"
	        redirect_to @user
	  
    else
      render 'new'
    end
  end

  private 
  
  def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
  end
  
  
  end
