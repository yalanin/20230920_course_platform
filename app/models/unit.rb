class Unit < ApplicationRecord
  # paranoid
  acts_as_paranoid

  # validation
  validates :name, :content, :position, presence: true
  validates_associated :chapter
  validates :position, numericality: { only_integer: true, greater_than: 0 }
  validates :position, uniqueness: { scope: :chapter_id }, on: :create

  # table relation
  belongs_to :chapter

  # scope
  default_scope { order(position: :asc) }
end
