class Chapter < ApplicationRecord
  # validation
  validates :name, presence: true
  validates_associated :course

  # table relation
  belongs_to :course
end
