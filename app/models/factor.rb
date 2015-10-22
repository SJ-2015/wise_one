class Factor < ActiveRecord::Base
	belongs_to :decision
	has_many :metrics
end
