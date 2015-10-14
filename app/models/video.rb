class Video < ActiveRecord::Base
	has_many :cast_and_crew_members, dependent: :destroy
	has_many :person_with_roles, through: :cast_and_crew_members
	has_many :people, through: :person_with_roles


	validates :title, :desc, presence: true

	def actors
		@actors_before_destroy || self.people.actors
	end

	def directors
		@directors_before_destroy || self.people.directors
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

	def update_video(args)
	  self.title = args[:title]
	  self.desc  = args[:desc]

	  # actors = args[:actors].split(',')
	  # self.add_actors(actors)

	  # directors = args[:directors].split(',')
	  # self.add_directors(directors)
	end

	def jsonify
		self.as_json(only: [:title, :desc], methods: [:actors, :directors])
	end

	# def update_actors
		
	# end

	# def update_directors
		
	# end



	# def to_json(*args)
	# 	self.as_json(only: [:title, :desc], methods: [:actors, :directors]).to_json
	# end
	
end
