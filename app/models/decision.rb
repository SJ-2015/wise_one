class Decision < ActiveRecord::Base
	belongs_to :user
	has_many :options
	has_many :factors
end
