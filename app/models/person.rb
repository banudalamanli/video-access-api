class Person < ActiveRecord::Base
	has_many :person_with_roles, dependent: :destroy
	has_many :roles, through: :person_with_roles

	validates :name, presence: true

	# While trying to find out a way to access associated actors of a video, found out here: http://www.informit.com/articles/article.aspx?p=2220311 
	# that in addition to being available at the class context, scopes are available automatically on has_many association attributes. Hence:
	scope :role, 			->(role) { inludes(:roles).where(roles: {role: role}).map(&:name) }
	scope :actors, 		-> { role('actor') }
	scope :directors, -> { role('director') }
end
