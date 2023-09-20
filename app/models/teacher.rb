class Teacher < ApplicationRecord
  # validation
  validates :name, presence: true
end
