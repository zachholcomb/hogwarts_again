require 'rails_helper'

RSpec.describe "Students index page" do
  it "can display a list of students with that that students number of teachers" do
    mcgonagall = Professor.create!(name: "Minerva McGonagall",
                              age: 204,
                              specialty: "Transfiguration")

    snape = Professor.create!(name: "Severus Snape",
        age: 65,
        specialty: "Potions")

    longbottom = Student.create!(name: "Neville Longbottom",
                                            age: 16,
                                            house: "Gryffindor")

    granger = Student.create!(name: "Hermione Granger",
                                            age: 16,
                                            house: "Gryffindor")

    lovegood = Student.create!(name: "Luna Lovegood",
                                            age: 16,
                                            house: "Gryffindor")

    pro_student1 = ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)
    pro_student2 = ProfessorStudent.create(student_id: longbottom.id, professor_id: mcgonagall.id)
    pro_student3 = ProfessorStudent.create(student_id: granger.id, professor_id: snape.id)
    pro_student4 = ProfessorStudent.create(student_id: lovegood.id, professor_id: snape.id)
    pro_student5 =  ProfessorStudent.create(student_id: lovegood.id, professor_id: snape.id)

    visit "/students"
    expect(page).to have_content("Neville Longbottom")
    expect(page).to have_content("Hermione Granger")
    expect(page).to have_content("Luna Lovegood")

    expect(page).to have_content("Neville Longbottom: 2")
    expect(page).to have_content("Hermione Granger: 1")
    expect(page).to have_content("Luna Lovegood: 2")
  end
end
