class Role < ActiveRecord::Base
	has_many :person_with_roles, dependent: :destroy
	has_many :people, through: :person_with_roles

	validates :role, presence:true, uniqueness: true
end
