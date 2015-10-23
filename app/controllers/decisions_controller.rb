class DecisionsController < ApplicationController

  def destroy
    id = params[:id]
    @decision = Decision.find(id)
    @decison.destroy
    redirect_to decisions_path
  end 

end
