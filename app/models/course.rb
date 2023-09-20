class Course < ApplicationRecord
  # validation
  validates :name, presence: true
  validates_associated :teacher

  # table relation
  belongs_to :teacher
end
