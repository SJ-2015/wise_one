class Metric < ActiveRecord::Base
	belongs_to :factor
	belongs_to :option

	def default_max_score
		@default_max_score = factor.max_score
	end


end
