# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

Contestant.create!(name: "Tyrian Lanister", age: 27, hometown: "Denver", years_of_experience: 8)
Contestant.create!(name: "Bran Stark", age: 21, hometown: "Boulder", years_of_experience: 3)
Contestant.create!(name: "John Snow", age: 24, hometown: "Fort Collins", years_of_experience: 12)
Contestant.create!(name: "Benjamin Stark", age: 35, hometown: "Longmont", years_of_experience: 5)

contestant_1.projects << project_1

contestant_2.projects << project_3

contestant_3.projects << project_1
contestant_3.projects << project_3

contestant_4.projects << project_1
contestant_4.projects << project_2
contestant_4.projects << project_4
