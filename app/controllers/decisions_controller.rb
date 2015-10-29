class DecisionsController < ApplicationController

  def create

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

    @user = @decision.user
    @factors = @decision.factors
    render :show

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


  def change_score
      id = params[:id]
      @decision = Decision.find(params[:id])
      render :change_score
  end

  def update_score
      decision_id = params[:id]

      @decision = Decision.find(decision_id)

      @metric_ids = params[:metric][:id]

      @score_array = params[:metric][:score]

      #http://railscasts.com/episodes/165-edit-multiple?view=asciicast
      @score_hash_array = []

      @score_array.each { |score_value|
        hash = {}
        hash[:score] = score_value
        @score_hash_array << hash
      }

      Metric.update(@metric_ids,@score_hash_array)

      @decision.tally_options


      redirect_to decision_metrics_path(decision_id)
  end

  def result_summary
      id = params[:id]
      @decision = Decision.find(id)

      @user = @decision.user
      @factors = @decision.factors

      #rank all the options associated with the decision by highest score first
      @ranked_options = @decision.options.order('total_score desc')

      @best_option = @ranked_options.first

      @max_points_for_options = @decision.max_points_for_option

      render :result_summary

  end

end











