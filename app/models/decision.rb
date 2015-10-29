class Decision < ActiveRecord::Base
	belongs_to :user
	has_many :options
	has_many :factors

	accepts_nested_attributes_for :factors, :options

	#https://github.com/nathanvda/cocoon/wiki/A-guide-to-doing-nested-model-forms


	def find_winner
		
	end

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

end
