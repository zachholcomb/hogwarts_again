require 'rails_helper'

RSpec.describe "Professors index page" do
  it "can show a list of professors" do
    snape = Professor.create!(name: "Severus Snape",
            age: 65,
            specialty: "Potions")
    mcgonagall = Professor.create!(name: "Minerva McGonagall",
                                  age: 204,
                                  specialty: "Transfiguration"
    )
    visit "/professors"
    expect(page).to have_content("Age:")
    expect(page).to have_content("Specialty:")
    expect(page).to have_content(snape.name)
    expect(page).to have_content(snape.age)
    expect(page).to have_content(snape.specialty)


    expect(page).to have_content(mcgonagall.name)
    expect(page).to have_content(mcgonagall.age)
    expect(page).to have_content(mcgonagall.specialty)
  end
end
