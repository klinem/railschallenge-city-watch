class Responder < ActiveRecord::Base
  # Avoid STI errors
  self.inheritance_column = nil

  # Validations
  # ===========

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :type, presence: true
  validates :capacity, presence: true, inclusion: { in: 1..5 }

end
