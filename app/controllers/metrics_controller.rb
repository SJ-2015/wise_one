class MetricsController < ApplicationController
	def index
    	decision_id = params[:decision_id]
    	
    	@decision = Decision.find(decision_id)
    	@user = @decision.user

    	@factors = @decision.factors

    	@options = @decision.options


    	render :index
	end


end
