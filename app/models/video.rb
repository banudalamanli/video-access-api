class Video < ActiveRecord::Base
	has_many :cast_and_crew_members, dependent: :destroy
	has_many :person_with_roles, through: :cast_and_crew_members
	has_many :people, through: :person_with_roles


	validates :title, :desc, presence: true

	def actors
		self.people.actors
	end

	def directors
		self.people.directors
	end

	def add_actors(actors)
		actors.each do |actor|
			self.add_cast_or_crew("actor", actor)
		end
		self
	end

	def add_directors(directors)
		directors.each do |director|
			self.add_cast_or_crew("director", director)
		end
		self
	end

	def add_cast_or_crew(role, person_name)
		self.person_with_roles << Person.create_with_role(role, name: person_name)
	end



	# def to_json(*args)
	# 	self.as_json(only: [:title, :desc], methods: [:actors, :directors]).to_json
	# end
	
end
