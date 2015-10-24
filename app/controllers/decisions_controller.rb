class DecisionsController < ApplicationController

  def create

    @decision = Decision.new
    decision_params = params.require(:decision).permit(:name, :description)
    decision_params[:user_id] = @current_user.id

    @decision = Decision.create(decision_params)

    redirect_to user_path(current_user)
    
  end		

  def destroy
    id = params[:id]
    @decision = Decision.find(id)
    @decison.destroy
    redirect_to decisions_path
  end 

end
