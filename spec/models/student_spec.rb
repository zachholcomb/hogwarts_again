require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:professors).through(:professor_students)}
  end

  describe '#professor_count' do
    it "can count students number of professors" do
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

      expect(longbottom.professor_count).to eq(2)
      expect(granger.professor_count).to eq(1)
      expect(lovegood.professor_count).to eq(2)
    end
  end
end
