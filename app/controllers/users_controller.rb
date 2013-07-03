class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
	@user = User.new(params[:user])
	if @user.save
      flash[:success] = "Account created successfully! Welcome to the to-do list!"
	  redirect_to @user
	else
	  render 'new'
	end
  end
  
  def show
    # show only if it's the current user or if current user is an admin
  
    @user = User.find(params[:id])
    if @user.nil?
      render 'new'
    end
  end
end
