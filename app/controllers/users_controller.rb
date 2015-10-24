class UsersController < ApplicationController
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
       #login(@user) 
       redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    
    @decision = @user.decisions.new
    render :show

  end


  private

  def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :password, :age, :gender)
  end



end
