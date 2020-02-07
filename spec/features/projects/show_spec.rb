require 'rails_helper'

describe "As a visitor" do
  describe "Projects Show Page" do
    it "shows the projects name and material and I see the theme of the challenge this project belongs to" do
      challenge_1 = recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      challenge_2 = furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      project_1 = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      project_2 = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

      project_3 = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      project_4 = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

      visit "/projects/#{project_1.id}"
      expect(page).to have_content("#{project_1.name}")
      expect(page).to have_content("Material: #{project_1.material}")
      expect(page).to have_content("Challenge Theme: #{challenge_1.theme}")

      visit "/projects/#{project_2.id}"
      expect(page).to have_content("#{project_2.name}")
      expect(page).to have_content("Material: #{project_2.material}")
      expect(page).to have_content("Challenge Theme: #{challenge_1.theme}")
    end

    it "Shows a count of the number of contestants on this project" do
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

      visit "/projects/#{project_1.id}"
      within "#contestant-count" do
        expect(page).to have_content("Number of Contestants: 3")
      end

      visit "/projects/#{project_2.id}"
      within "#contestant-count" do
        expect(page).to have_content("Number of Contestants: 1")
      end

      visit "/projects/#{project_3.id}"
      within "#contestant-count" do
        expect(page).to have_content("Number of Contestants: 2")
      end
    end
    
    it "shows the average years of experience for the contestants who worked that project" do
      challenge_1 = recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      challenge_2 = furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      project_1 = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      project_2 = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      contestant_1 = Contestant.create!(name: "Tyrian Lanister", age: 27, hometown: "Denver", years_of_experience: 14)
      contestant_2 = Contestant.create!(name: "Bran Stark", age: 21, hometown: "Boulder", years_of_experience: 6)
      contestant_3 = Contestant.create!(name: "John Snow", age: 24, hometown: "Fort Collins", years_of_experience: 12)
      contestant_4 = Contestant.create!(name: "Benjamin Stark", age: 35, hometown: "Longmont", years_of_experience: 8)

      contestant_1.projects << project_1
      contestant_3.projects << project_1
      contestant_4.projects << project_1


      contestant_2.projects << project_2
      contestant_3.projects << project_2
      contestant_4.projects << project_2


      visit "/projects/#{project_1.id}"
      within "#average-years-exp" do
        expect(page).to have_content("Average Contestant Experience: 28.66")
      end

      visit "/projects/#{project_2.id}"
      within "#average-years-exp" do
        expect(page).to have_content("Average Contestant Experience: 8.66")
      end
    end
  end
end
