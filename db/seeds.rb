actors = ["Tom Cruise","John Smith","Angelina Jolie"]
directors = ["Steven Spielberg"]

new_vid = Video.create({title: "new title", desc: "new description"})
new_vid.add_actors(actors)
new_vid.add_directors(directors)

