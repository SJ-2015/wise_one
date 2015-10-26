class DecisionsController < ApplicationController

  def create

    #@decision = Decision.new
    decision_params = params.require(:decision).permit(:name, :description)
    decision_params[:user_id] = @current_user.id
    @decision = Decision.create(decision_params)
    redirect_to user_path(current_user)

  end		

  def destroy
    id = params[:id]
    
    @decision = Decision.find(id)
    @decision.destroy

    redirect_to user_path(current_user)

  end 

  def show
    id = params[:id]
    @decision = Decision.find(id)
    
    #@options= @decision.options

  end

  def edit
    id = params[:id]
    @decision = Decision.find(params[:id])
  end

  def update
    decision_id = params[:id]
    @decision = Decision.find(decision_id)
    @user = current_user

    #get updated data
    updated_attributes = params.require(:decision).permit(:name, :descripton)

    if @decision.update_attributes(updated_attributes)
      redirect_to user_path(@user.id)
    else
      render :edit
    end  
  end



end
