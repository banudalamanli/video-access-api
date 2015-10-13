class Person < ActiveRecord::Base
	has_many :person_with_roles, dependent: :destroy
	has_many :roles, through: :person_with_roles

	validates :name, presence: true

	# While trying to find out a way to access associated actors of a video, found out here: http://www.informit.com/articles/article.aspx?p=2220311 
	# that in addition to being available at the class context, scopes are available automatically on has_many association attributes. Hence:
	scope :role, 			->(role) { includes(:roles).where(roles: {role: role}).map(&:name) }
	scope :actors, 		-> { role('actor') }
	scope :directors, -> { role('director') }

	def self.create_with_role(role, *person)
		person = Role.find_or_create_by(role: role).people.find_or_create_by(*person)
		person.person_with_roles.first
	end
end



# Looked into possible ways to avoid having to create a scope for every role that might be defined in the future i.e. Executive Producer, Writer, etc. Learned a bit more about memoization and metaprogramming - method_missing delegation in the process.

# @roles = [] # memoize roles in a class instance variable

# def self.method_missing(method, *args)
# 	method = method.to_s.singularize # normalize

# 	return role(method) if @roles.include? method # memoized validation

# 	@roles << method # memoization

# 	return role(method) if Role.find_by(role: method)
	
# 	super
# end