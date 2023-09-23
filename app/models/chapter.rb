class Chapter < ApplicationRecord
  # paranoid
  acts_as_paranoid

  # validation
  validates :name, :position, presence: true
  validates_associated :course
  validates :position, numericality: { only_integer: true, greater_than: 0 }
  validates :position, uniqueness: { scope: :course_id }, on: :create

  # table relation
  belongs_to :course
  has_many :units, dependent: :destroy

  # nested form
  accepts_nested_attributes_for :units, allow_destroy: true, reject_if: :all_blank

  # scope
  default_scope { order(position: :asc) }
end
