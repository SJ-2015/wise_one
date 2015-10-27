class Factor < ActiveRecord::Base
	after_create :add_metrics_to_existing_options

	belongs_to :decision
	has_many :metrics

	#add metrics associated with the new factor to existing options, take the max_score as default
    def add_metrics_to_existing_options
    	@factor_options = decision.options
    	@factor_options.each do |option|
          Metric.create(score:max_score, factor_id:id, option_id:option.id)
        end  
    end   

end
