class Option < ActiveRecord::Base
	belongs_to :decision
	has_many :metrics

		#grab the metrics to render for metric index page. If metric does not exit, render the max_score
	def metric(factor)
		#find the metrics associated with an option, and all the factors associated with it
			# code can be refactored --> .first is not efficient, can target id directly
		metric = metrics.where(factor_id: factor.id).first

		#if the metric exist, the render the metric, otherwise render the max_score associate with factor
		metric ? metric.score : factor.max_score
	end

end
