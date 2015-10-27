class OptionsController < ApplicationController
  def create
      option_params = params.require(:option).permit(:name)
      option_params[:decision_id] = params[:decision_id]

      @option = Option.create(option_params)
      redirect_to decision_options_path(params[:decision_id])
  end   

  def new
      @decision_id = params[:decision_id]
      @option = Option.new
      render :new
  end

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

  	def edit
    	id = params[:id]
    	@decision = Decision.find(params[:decision_id])
    	@option = Option.find(id)
  	end

  	def update
	    option_id = params[:id]
	    @option = Option.find(option_id)

	    #get updated data
	    updated_attributes = params.require(:option).permit(:name, :description)

	    if @option.update_attributes(updated_attributes)
	      #redirect to index
	      redirect_to decision_options_path(@option.decision)
	    else
	      render :edit
	    end  
  	end

end
