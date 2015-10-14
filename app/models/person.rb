class Person < ActiveRecord::Base
	has_many :person_with_roles, dependent: :destroy
	has_many :roles, through: :person_with_roles

	validates :name, presence: true

	scope :role, 			->(role) { includes(:roles)
																	.where(roles: {role: role})
																	.map(&:name) }
	scope :actors, 		-> { role('actor') }
	scope :directors, -> { role('director') }

	def self.create_with_role(role, *person)
		person = Role.find_or_create_by(role: role).people.find_or_create_by(*person)
		person.person_with_roles.first
	end
end