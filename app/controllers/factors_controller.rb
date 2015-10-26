class FactorsController < ApplicationController

	def create
	    factor_params = params.require(:factor).permit(:name, :max_score)
	    factor_params[:decision_id] = params[:decision_id]

	    @factor = Factor.create(factor_params)
	    redirect_to decision_path(params[:decision_id])
	end		

	def new
	    @decision_id = params[:decision_id]
	    @factor = Factor.new
	    render :new
	end

	def edit
    	id = params[:id]
    	@decision = Decision.find(params[:decision_id])
    	@factor = Factor.find(id)
  	end

  	def update
	    factor_id = params[:id]
	    @factor = Factor.find(factor_id)

	    #get updated data
	    updated_attributes = params.require(:factor).permit(:name, :max_score)

	    if @factor.update_attributes(updated_attributes)
	      #redirect to show
	      redirect_to decision_path(@factor.decision_id)
	    else
	      render :edit
	    end  
  	end

    def destroy

	    id = params[:id]
	    @factor = Factor.find(id)
	    @factor.destroy
	    redirect_to decision_path(@factor.decision_id)
	end 

end
