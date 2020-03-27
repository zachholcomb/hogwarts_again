class Professor <ApplicationRecord
  validates_presence_of :name, :age, :specialty
  has_many :professor_students, dependent: :destroy
  has_many :students, through: :professor_students
end
