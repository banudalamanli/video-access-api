class Role < ActiveRecord::Base
	validates :role, presence:true, uniqueness: true
end
