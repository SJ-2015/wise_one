class Decision < ActiveRecord::Base
	belongs_to :user
	has_many :options
	has_many :factors

	accepts_nested_attributes_for :factors, :options

	#https://github.com/nathanvda/cocoon/wiki/A-guide-to-doing-nested-model-forms


	def tally_options
		#find each option associated with the decision

		#update the total_score for each of option, using method in option_model
		@options = Decision.find(id).options
		@options.each { |option|
			option.update_total_score
		}
	end

	def max_points_for_options
		@max_points_for_options = factors.sum(:max_score)
	end

	def rank_options
		@ranke_options = options.order(total_score: :desc)
	end

	def winner_factor_labs
    	factors.map do |factor|
      		factor.name
    	end
    end

	#does not work yet: need to revise
	def score_by_factors_array
	    @score_by_factors_master_array = []
	      #this is for result_summary page, so knows to grab @factors

	    @factor_ids = Decision.find(id).factors.map(&:id)


	    @factor_ids.each { |factor_id|
	          #start with an empty factor_score array
	          #for each factor, iterator all options 
	          #grab the option.metrics with the matching factor_id, put into one factor_score_array
	        temp_factor_score_array = []

	            @ranked_options.each { |option|
	              temp_score = Option.find(option.id).metrics.find_by_factor_id(factor_id).score
	              temp_factor_score_array << temp_score
	            }

	          #put the factor_score_arrarry into master array
	        @score_by_factors_master_array << temp_factor_score_array
	    } 
	end


end
