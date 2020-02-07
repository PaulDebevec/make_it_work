require 'rails_helper'
describe "As a visitor" do
  describe "On the project show page I see a field to add a contestant to the project" do
    it "Upon enterring a contestants id it adds the contestant to that project" do
      challenge_1 = recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      challenge_2 = furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      project_1 = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      project_2 = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      contestant_1 = Contestant.create!(name: "Tyrian Lanister", age: 27, hometown: "Denver", years_of_experience: 14)
      contestant_2 = Contestant.create!(name: "Bran Stark", age: 21, hometown: "Boulder", years_of_experience: 6)
      contestant_3 = Contestant.create!(name: "John Snow", age: 24, hometown: "Fort Collins", years_of_experience: 12)
      contestant_4 = Contestant.create!(name: "Benjamin Stark", age: 35, hometown: "Longmont", years_of_experience: 8)

      visit "/projects/#{project_2.id}"

      fill_in :contestant_id, with: contestant_1.id
      click_on "Add Contestant"

      expect(current_path).to eq("/projects/#{project_2.id}")

      within "#contestant-count" do
        expect(page).to have_content("Number of Contestants: 1")
      end

      visit "/contestants"
      within "#contestant-#{contestant_1.id}" do
        expect(page).to have_content("Tyrian Lanister")
        expect(page).to have_content("Upholstery Tuxedo") # project 2
      end
    end
  end
end
