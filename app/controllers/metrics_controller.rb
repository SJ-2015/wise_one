class MetricsController < ApplicationController
	def index
    	decision_id = params[:decision_id]
    	
    	@decision = Decision.find(decision_id)
    	@user = @decision.user

    	@options = @decision.options
    	@factors = @decision.factors


    	render :index
	end


end
