class UsersController < ApplicationController
  # before_action :new_decision, only: [:show, :index]

	# grab the users
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       login(@user) 
       redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @decision = Decision.new
    render :show

  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    updated_params = user_params
    @user.update(updated_params)
    
    @user.update_attribute(:first_name, updated_params[:first_name])
    @user.update_attribute(:last_name, updated_params[:last_name])
    @user.update_attribute(:age, updated_params[:age])

    redirect_to user_path
  end

  private

  def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :password, :age, :gender)
  end



end
