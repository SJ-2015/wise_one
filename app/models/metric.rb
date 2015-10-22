class Metric < ActiveRecord::Base
	belongs_to :factor
	belongs_to :option
end
