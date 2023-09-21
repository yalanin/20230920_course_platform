class Chapter < ApplicationRecord
  # validation
  validates :name, presence: true
  validates_associated :course

  # table relation
  belongs_to :course
  has_many :units, dependent: :destroy

  # nested form
  accepts_nested_attributes_for :units, allow_destroy: true, reject_if: :all_blank
end
