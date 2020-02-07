require 'rails_helper'

describe "As a visitor" do
  describe "Contestants Index Page" do
    it "shows the projects name and material and I see the theme of the challenge this project belongs to" do
      challenge_1 = recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      challenge_2 = furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      project_1 = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      project_2 = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

      project_3 = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      project_4 = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

      contestant_1 = Contestant.create!(name: "Tyrian Lanister", age: 27, hometown: "Denver", years_of_experience: 8)
      contestant_2 = Contestant.create!(name: "Bran Stark", age: 21, hometown: "Boulder", years_of_experience: 3)
      contestant_3 = Contestant.create!(name: "John Snow", age: 24, hometown: "Fort Collins", years_of_experience: 12)
      contestant_4 = Contestant.create!(name: "Benjamin Stark", age: 35, hometown: "Longmont", years_of_experience: 5)

      contestant_1.projects << project_1

      contestant_2.projects << project_3

      contestant_3.projects << project_1
      contestant_3.projects << project_3

      contestant_4.projects << project_1
      contestant_4.projects << project_2
      contestant_4.projects << project_4

      visit '/contestants'

      within "#contestant-#{contestant_1.id}" do
        expect(page).to have_content("Tyrian Lanister")
        expect(page).to have_content("News Chic") # project 1
      end

      within "#contestant-#{contestant_2.id}" do
        expect(page).to have_content("Bran Stark")
        expect(page).to have_content("Upholstery Tuxedo") # project 3
      end

      within "#contestant-#{contestant_3.id}" do
        expect(page).to have_content("John Snow")
        expect(page).to have_content("News Chic") # project 1
        expect(page).to have_content("Upholstery Tuxedo") # project 3
      end

      within "#contestant-#{contestant_4.id}" do
        expect(page).to have_content("Benjamin Stark")
        expect(page).to have_content("News Chic") # project 1
        expect(page).to have_content("Boardfit") # project 2
        expect(page).to have_content("Litfit") # project 4
      end
    end
  end
end
