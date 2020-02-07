require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "instance methods" do
    it ".contestant_count" do
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
    contestant_2.projects << project_1
    contestant_3.projects << project_1

    contestant_3.projects << project_2
    contestant_4.projects << project_2

    contestant_4.projects << project_3

    contestant_4.projects << project_4

    expect(project_1.contestant_count).to eq(3)
    expect(project_2.contestant_count).to eq(2)
    expect(project_3.contestant_count).to eq(1)
    expect(project_4.contestant_count).to eq(1)
    end
  end
end
