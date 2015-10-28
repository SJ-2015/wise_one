class Decision < ActiveRecord::Base
	belongs_to :user
	has_many :options
	has_many :factors

	accepts_nested_attributes_for :factors, :options

	#https://github.com/nathanvda/cocoon/wiki/A-guide-to-doing-nested-model-forms


end
