class Option < ActiveRecord::Base
	after_create :add_metrics_to_existing_factors

	belongs_to :decision
	has_many :metrics

	def add_metrics_to_existing_factors
    	@option_factors = decision.factors
    	@option_factors.each do |factor|
          Metric.create(score:factor.max_score, factor_id:factor.id, option_id:id)
     	end 
    end 


		#grab the metrics to render for metric index page
	def metric(factor)
		#find the metrics associated with an option, and all the factors associated with it
			# code can be refactored --> .first is not efficient, can target id directly
		metric = metrics.where(factor_id: factor.id).first

		#if the metric exist, the render the metric, otherwise render the max_score associate with factor
		metric ? metric.score : 0
	end

end
