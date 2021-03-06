class Student <ApplicationRecord
  validates_presence_of :name, :age, :house
  has_many :professor_students, dependent: :destroy
  has_many :professors, through: :professor_students

  def professor_count
    professors.count
  end
end
