class User < ActiveRecord::Base
	has_many :decisions
end
