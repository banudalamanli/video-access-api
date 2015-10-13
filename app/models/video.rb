class Video < ActiveRecord::Base
	has_many :cast_and_crew_members, dependent: :destroy
	has_many :person_with_roles, through: :cast_and_crew_members
	has_many :people, through: :person_with_roles

	validates :title, :desc, presence: true
end
