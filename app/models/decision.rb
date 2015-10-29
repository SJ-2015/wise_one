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
		@rank_options = options.order(total_score: :desc)
	end

	def winner_factor_labs
    	factors.map do |factor|
      		factor.name
    	end
    end

    #for charting of each factor's max score
    def factor_max_labs
    	factors.map do |factor|
      		factor.max_score
    	end
    end

    #for charting of winner's score
    def winner_factor_score
    	@winner = Decision.find(id).rank_options.first

    	factors.map do |factor|
      		@winner.metrics.find_by_factor_id(factor.id).score
    	end
    end


	#does not work yet: need to revise
	def score_by_factors_array
	    @score_by_factors_master_array = []

	    @factor_ids = Decision.find(1).factors.map(&:id)

	    @rank_options = options.order(total_score: :desc)


	    @factor_ids.each { |factor_id|
	          # start with an empty factor_score array
	          # for each factor, iterator all options 
	          # grab the option.metrics with the matching factor_id, put into one factor_score_array
	        temp_factor_score_array = []

		            @rank_options.each { |option|
		              temp_score = Option.find(option.id).metrics.find_by_factor_id(factor_id).score
		              temp_factor_score_array << temp_score
		            }

	          #put the factor_score_arrarry into master array
	        @score_by_factors_master_array << temp_factor_score_array
	    } 

	    @score_by_factors_master_array

	end


end
