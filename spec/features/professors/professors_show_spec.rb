require 'rails_helper'

RSpec.describe "Professors show page" do
  it "can show a list of that professors students" do
    mcgonagall = Professor.create!(name: "Minerva McGonagall",
                                  age: 204,
                                  specialty: "Transfiguration")

    mcgonagall.students.create!(name: "Neville Longbottom",
                                            age: 16,
                                            house: "Gryffindor")

    mcgonagall.students.create!(name: "Hermione Granger",
                                            age: 16,
                                            house: "Gryffindor")

    mcgonagall.students.create!(name: "Luna Lovegood",
                                            age: 16,
                                            house: "Gryffindor")
    visit "/professors/#{mcgonagall.id}"
    expect(page).to have_content("Neville Longbottom")
    expect(page).to have_content("Hermione Granger")
    expect(page).to have_content("Luna Lovegood")
  end
end
