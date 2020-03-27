require 'rails_helper'

RSpec.dsescribe "Professors show page" do
  it "can show a list of that professors students" do
    snape = Professor.create!(name: "Severus Snape",
            age: 65,
            specialty: "Potions")
    mcgonagall = Professor.create!(name: "Minerva McGonagall",
                                  age: 204,
                                  specialty: "Transfiguration")

    snape.students.create!(name: "Draco Malfoy",
                                      age: 16,
                                      house: "Slytherin")
    mconagall.students.create!(name: "Neville Longbottom",
                                            age: 16,
                                            house: "Gryffindor")

    visit "/professors/#{mconagall.id}"
  end
end

#
# ```
# User Story 2 of 4
# As a visitor,
# When I visit '/professors/:id'
# I see a list of the names of the students the professors have.
# (e.g. "Neville Longbottom"
#       "Hermione Granger"
#       "Luna Lovegood")
