class Role < ActiveRecord::Base
	has_many :person_with_roles, dependent: :destroy
	has_many :people, through: :person_with_roles

	validates :role, presence:true, uniqueness: true
	
	# Should define a method that transforms input to be downcase only to ensure there are no duplicate roles i.e. "Actor" and "actor"
end
