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
    end
  end
end
