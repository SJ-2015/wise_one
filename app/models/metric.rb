class Metric < ActiveRecord::Base
	belongs_to :factor
	belongs_to :option

	def default_max_score
		@default_max_score = factor.max_score
	end

	def render_metric_score(factor_id, option_id)
		@render_metric_score = Metric.where(factor_id:factor_id).where(option_id:opton_id)
	end

end
