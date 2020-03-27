require 'rails_helper'

RSpec.describe "Professors index page" do
  it "can show a list of professors" do
    snape = Professor.create!(name: "Severus Snape",
            age: 65,
            specialty: "Potions")
    visit "/professors"
    expect(page).to have_content(snape.name)
    expect(page).to have_content(snape.age)
    expect(page).to have_content(snape.specialty)
  end
end

# User Story 1 of 4
# As a visitor,
# When I visit '/professors',
# I see a list of professors with the following information:
# -Name
# -Age
# -Specialty
# (e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")
# ```
