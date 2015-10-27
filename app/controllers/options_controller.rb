class OptionsController < ApplicationController

	def index
    	decision_id = params[:decision_id]
    	
    	@decision = Decision.find(decision_id)
    	@user = @decision.user

    	@options = @decision.options
	end


	def destroy
    	id = params[:id]
    	@option = Option.find(id)
    	@option.destroy
    	redirect_to decision_options_path(params[:decision_id])
  	end 

end
