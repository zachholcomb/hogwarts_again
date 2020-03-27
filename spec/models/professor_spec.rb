require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  describe '#average_student_age' do
    it "can average the age of each professors students" do

      snape = Professor.create!(name: "Severus Snape",
          age: 65,
          specialty: "Potions")

      longbottom = Student.create!(name: "Neville Longbottom",
                                              age: 15,
                                              house: "Gryffindor")

      granger = Student.create!(name: "Hermione Granger",
                                              age: 20,
                                              house: "Gryffindor")

      lovegood = Student.create!(name: "Luna Lovegood",
                                              age: 17,
                                              house: "Gryffindor")

      pro_student1 = ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)
      pro_student3 = ProfessorStudent.create(student_id: granger.id, professor_id: snape.id)
      pro_student4 = ProfessorStudent.create(student_id: lovegood.id, professor_id: snape.id)

      expect(snape.average_student_age).to eq()
    end
  end
end
