class Decision < ActiveRecord::Base
	belongs_to :user
	has_many :options
	has_many :factors

	accepts_nested_attributes_for :factors

	def render_metric_score(factor_id, option_id)
		@render_metric_score = Metric.where(factor_id:factor_id).where(option_id:option_id)
	end

end
