class Unit < ApplicationRecord
  # validation
  validates :name, :content, presence: true
  validates_associated :chapter

  # table relation
  belongs_to :chapter
end
