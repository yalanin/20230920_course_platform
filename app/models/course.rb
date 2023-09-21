class Course < ApplicationRecord
  # validation
  validates :name, presence: true
  validates_associated :teacher

  # table relation
  belongs_to :teacher
  has_many :chapters, dependent: :destroy
  has_many :units, through: :chapters

  # nested form
  accepts_nested_attributes_for :chapters, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :units, allow_destroy: true, reject_if: :all_blank
end
